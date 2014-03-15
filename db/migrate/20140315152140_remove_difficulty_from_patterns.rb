class RemoveDifficultyFromPatterns < ActiveRecord::Migration
  def up
    remove_column :patterns, :difficulty
  end

  def down
    add_column :patterns, :difficulty, :string
  end
end
