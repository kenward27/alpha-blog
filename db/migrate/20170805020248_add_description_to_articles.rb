class AddDescriptionToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :description, :text #give table name first, then attribute name, then the type for the attribute
    add_column :articles, :created_at, :datetime
    add_column :articles, :updated_at, :datetime
  end
end
