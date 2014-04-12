class FixTypeColumnNameInStitches < ActiveRecord::Migration
  def change
    rename_column :stitches, :type, :stitch_symbol
  end
end
