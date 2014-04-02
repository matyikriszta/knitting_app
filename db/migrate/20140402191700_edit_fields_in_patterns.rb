class EditFieldsInPatterns < ActiveRecord::Migration
  def up
    change_column :stitches, :position, :integer, :default => nil, :null => true
    change_column :stitches, :color, :string, :default => nil, :null => true
    change_column :stitches, :type, :string, :default => nil, :null => true
    change_column :stitches, :row_id, :integer, :null => false
  end

  def down
  end
end
