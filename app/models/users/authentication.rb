module Users
  # The Users::Authentication module provides the authentication ability for models such
  # as a User(duh). The following fields become provided via this module:
  #
  #   crypted_password - Encrypted Password stored in the document
  #
  # In addition, it has two dirty attributes to facilitate the storage of password:
  #
  #   password              - the plain text password, which does NOT get saved in the document
  #   password_confirmation - the password confirmation
  #
  # This module also ties to the Warden Library that is being used in the Guardian App. This manages
  # all the authentication of the system and relies on this module to interact with the main
  # system.
  #
  module Authentication

    def self.included(model)
      model.class_eval do
        attr_accessor :password, :password_confirmation

        field :crypted_password, :type => String

        validates_confirmation_of :password, :if => :password_required
        validates_length_of       :password, :within => 6..33, :if => :password_required

        before_save :crypt_password, :if => :password_required

        # Authenticate a user. First, finds the user by the username, if the user exists,
        # match it by password. If the password is correct, return the user else return nil.
        #
        def self.authenticate(username, password)
          u = where(:username => username).first if username.present?
          u && u.send(:has_password?,password) ? u : nil
        end

        private

          # Helper to check if passwords match
          #
          def has_password?(password)
            ::BCrypt::Password.new(self.crypted_password) == password
          end

          # Encrypt the password and store it in the document.
          #
          def crypt_password
            self.crypted_password = ::BCrypt::Password.create(password)
          end

          # If there doesn't exist a crypted password, then its probably a new user.
          # If there exists a password and password_confirmation, then its probably a password change.
          #
          def password_required
            self.crypted_password.blank? || ( self.password.present? && self.password_confirmation.present? )
          end
      end
    end

  end
end

