class Article < ApplicationRecord

    validates :title, presence: true
    validates :content, presence: true
    validates :created_by, presence: true
end
