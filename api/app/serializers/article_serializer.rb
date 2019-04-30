class ArticleSerializer < ActiveModel::Serializer
  
  attributes :id, :title, :content, :created_at
  
  belongs_to :user

end
