class DropAtFieldsFromStitches < ActiveRecord::Migration
  def up
    remove_column :stitches, :created_at
    remove_column :stitches, :updated_at
  end

  def down
    add_column :stitches, :created_at, :datetime
    add_column :stitches, :updated_at, :datetime
  end
end
