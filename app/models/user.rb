class User < ActiveRecord::Base
    attr_accessor :password, :salt
    before_save :encrypt_password
    after_save :clear_password
    has_many :media_pages

    EMAIL_REGEX = /\A[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\z/i

    validates :name, presence: true, uniqueness: true
    validates :email, presence: true, uniqueness: true, format: EMAIL_REGEX
    validates :password, presence: true
    validates_length_of :password, in: 5..20, on: create

    def encrypt_password
        if password.present?
            self.salt = BCrypt::Engine.generate_salt
            self.encrypted_password = BCrypt::Engine.hash_secret(password, salt)
        end
    end

    def clear_password
        self.password = nil
    end
end