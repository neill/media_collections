class User < ActiveRecord::Base
    attr_accessible :name, :email, :password
    has_many :media_pages
    has_secure_password

    EMAIL_REGEX = /\A[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\z/i

    validates :name, presence: true, uniqueness: true
    validates :email, presence: true, uniqueness: true, format: EMAIL_REGEX
    validates :password, presence: true
end