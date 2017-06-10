class CreatePortalSources < ActiveRecord::Migration[5.0]
  def change
    create_table :portal_sources do |t|
      t.string :name
      t.integer :size, default: 50

      t.timestamps
    end
  end
end
