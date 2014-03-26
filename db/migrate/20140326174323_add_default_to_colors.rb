class AddDefaultToColors < ActiveRecord::Migration
  def change
    add_column :colors, :default, :boolean
  end
end
