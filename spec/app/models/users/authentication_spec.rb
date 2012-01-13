require File.expand_path('../../../../spec_helper', __FILE__)

describe "Users::Authentication" do
  let(:user) { User.new }

  describe "defintion" do
    it "has a password" do
      assert user.respond_to? :password
    end

    it "has a password confirmation" do
      assert user.respond_to? :password_confirmation
    end

    it "has a crypted password" do
      assert_has_field User, :crypted_password, {:type => String}
    end

    it "validates password if password required" do
      assert_has_validation User, :validates_confirmation_of, :password, {:if => :password_required}
    end

    it "validate password is within 6 to 33 characters" do
      assert_has_validation User, :validates_length_of, :password, {:within => 6..33}
    end
  end

  describe "on password mechanism" do
    let(:user) do
      User.make :password => 'password123', :password_confirmation => 'password123'
      User.first
    end

    describe "with a new user" do
      it "creates a crypted password" do
        assert user.respond_to? :crypted_password
        refute_equal 'password123', user.crypted_password
      end
    end

    it "doesn't re-encrypt on a save" do
      crypt = user.crypted_password
      user.save
      assert_equal crypt, user.reload.crypted_password
    end

    it "re-encrypts on a password change" do
      old = user.crypted_password
      user.password              = "god12345"
      user.password_confirmation = "god12345"
      user.save
      refute_equal old, user.reload.crypted_password
    end
  end

  describe "#authenticate" do
    let(:user) do
      User.make :username => 'johnny', :password => 'johnny123', :password_confirmation => 'johnny123'
    end

    it "returns user if password matches" do
      assert_equal user, User.authenticate('johnny', 'johnny123')
    end

    it "returns nil if password doesn't match" do
      assert_nil User.authenticate 'johnny', 'hotdog123'
    end
  end
end
