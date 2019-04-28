class ArticleSerializer < ActiveModel::Serializer
  
  attributes :id, :title, :content, :created_at

end
