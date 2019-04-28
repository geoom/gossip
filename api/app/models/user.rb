class User < ApplicationRecord

    has_many :articles, foreign_key: :created_by

    validates :name, presence: true
    validates :email, presence: true
    validates :password_digest, presence: true

    has_secure_password
end
