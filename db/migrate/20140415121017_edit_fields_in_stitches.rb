class EditFieldsInStitches < ActiveRecord::Migration
  def up
    change_column :stitches, :stitch_symbol, :string, :default => ""
  end

  def down
    change_column :stitches, :stitch_symbol, :string
  end
end
