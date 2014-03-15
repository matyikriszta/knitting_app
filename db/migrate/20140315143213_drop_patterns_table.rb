class DropPatternsTable < ActiveRecord::Migration
  def up
    drop_table :patterns
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
