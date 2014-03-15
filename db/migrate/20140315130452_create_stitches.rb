class CreateStitches < ActiveRecord::Migration
  def change
    create_table :stitches do |t|
      t.references :row
      t.string :color
      t.string :type
      t.integer :position

      t.timestamps
    end
    add_index :stitches, :row_id
  end
end
