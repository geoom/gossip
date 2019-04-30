class User < ApplicationRecord

    has_many :articles, dependent: :destroy

    validates :email, presence: true
    validates :email, uniqueness: true
    validates :email, length: { minimum: 8 }
    validates :password_digest, presence: true

    has_secure_password
end
