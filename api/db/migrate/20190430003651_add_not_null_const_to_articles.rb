class AddNotNullConstToArticles < ActiveRecord::Migration[5.2]
  def change
    change_column_null :articles, :title, false
    change_column_null :articles, :content, false
    remove_column :articles, :created_by, :string, null: true
  end
end
