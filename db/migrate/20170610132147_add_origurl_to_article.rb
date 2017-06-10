class AddOrigurlToArticle < ActiveRecord::Migration[5.0]
  def change
    add_column :articles, :origurl, :string
  end
end
