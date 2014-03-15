class CreateRows < ActiveRecord::Migration
  def change
    create_table :rows do |t|
      t.references :pattern
      t.integer :no_of_stitches
      t.integer :position

      t.timestamps
    end
    add_index :rows, :pattern_id
  end
end
