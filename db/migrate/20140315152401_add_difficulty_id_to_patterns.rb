class AddDifficultyIdToPatterns < ActiveRecord::Migration
  def change
    add_column :patterns, :difficulty_id, :integer
  end
end
