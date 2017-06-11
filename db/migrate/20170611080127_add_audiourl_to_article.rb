class AddAudiourlToArticle < ActiveRecord::Migration[5.0]
  def change
    add_column :articles, :audiourl, :string
  end
end
