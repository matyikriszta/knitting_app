class AddSequenceToPatterns < ActiveRecord::Migration
  def change
    add_column :patterns, :sequence, :string
  end
end
