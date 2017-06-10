class CreateArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :articles do |t|
      t.string :headline
      t.text :textonly
      t.date :date_published
      t.text :textorig
      t.references :portal_source, foreign_key: true

      t.timestamps
    end
  end
end
