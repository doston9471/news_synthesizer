class CreateArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :articles do |t|
      t.string :headline
      t.text :textonly
      t.date :datepublished
      t.text :textorig

      t.timestamps
    end
  end
end
