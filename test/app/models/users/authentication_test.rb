require File.expand_path('../../../../test_config', __FILE__)

context "Users::Authentication" do
  purge!

  setup do
    User.class_eval { include Users::Authentication }
  end

  context "defintion" do
    setup { User }

    asserts("@password")              { User.new }.responds_to :password
    asserts("@password_confirmation") { User.new }.responds_to :password_confirmation

    asserts_topic.has_field :crypted_password, :type => String

    asserts_topic.has_validation :validates_confirmation_of, :password, :if => :password_required
    asserts_topic.has_validation :validates_length_of,       :password, :within => 6..33, :if => :password_required
  end

  context "on password mechanism" do
    setup do
      User.make :password => 'password123', :password_confirmation => 'password123'
      User.first
    end

    context "with a new user" do
      asserts(:crypted_password)
      denies(:crypted_password).equals 'password123'
    end

    denies "that it re-encrypts on a save" do
      crypt = topic.reload.crypted_password
      topic.save ; crypt != topic.reload.crypted_password
    end

    asserts "that it re-encrypts on a password change" do
      user = User.first
      old = user.crypted_password
      user.password              = "god12345"
      user.password_confirmation = "god12345"
      user.save
      old != user.reload.crypted_password
    end
  end

  context "#authenticate" do
    setup do
      User.make :username => 'johnny', :password => 'johnny123', :password_confirmation => 'johnny123'
    end

    asserts "#authenticate returns user if password match" do
      User.authenticate('johnny', 'johnny123') == User.where(:username => 'johnny').first
    end

    asserts "#autenticate returns nil if password doesn't match" do
      User.authenticate 'johnny', 'hotdog123'
    end.nil
  end

end

