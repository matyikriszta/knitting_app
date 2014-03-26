class CreateColors < ActiveRecord::Migration
  def change
    create_table :colors do |t|
      t.references :pattern
      t.string :color

      t.timestamps
    end
    add_index :colors, :pattern_id
  end
end
