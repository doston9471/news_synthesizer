class AddAudioToArticle < ActiveRecord::Migration[5.0]
  def change
    add_column :articles, :audio, :string
  end
end
