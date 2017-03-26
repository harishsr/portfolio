class CreateEntries < ActiveRecord::Migration[5.0]
  def change
    create_table :entries do |t|
      t.string :title, 
        null: false, 
        index: true

      t.text :content, 
        null: false

      t.boolean :favorite, 
        default: false

      t.references :admin, 
        null: false

      t.timestamps
    end
  end
end
