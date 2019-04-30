class Article < ApplicationRecord

    belongs_to :user

    validates :user, presence: true
    validates :title, presence: true
    validates :title, length: { minimum: 5 }
    validates :content, presence: true
    validates :content, length: { minimum: 50 }
end
