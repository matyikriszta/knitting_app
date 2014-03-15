class CreatePatterns < ActiveRecord::Migration
  def change
    create_table :patterns do |t|
      t.string :name
      t.references :user
      t.string :status
      t.integer :no_of_rows
      t.string :difficulty
      t.string :description
      t.text :instructions
      t.text :notes
      t.string :yarn
      t.string :equipment
      t.references :category

      t.timestamps
    end
    add_index :patterns, :user_id
    add_index :patterns, :category_id
  end
end
