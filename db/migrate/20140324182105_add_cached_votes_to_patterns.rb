class AddCachedVotesToPatterns < ActiveRecord::Migration
  def self.up
    add_column :patterns, :cached_votes_total, :integer, :default => 0
    add_column :patterns, :cached_votes_score, :integer, :default => 0
    add_column :patterns, :cached_votes_up, :integer, :default => 0
    add_column :patterns, :cached_votes_down, :integer, :default => 0
    add_column :patterns, :cached_weighted_score, :integer, :default => 0
    add_index  :patterns, :cached_votes_total
    add_index  :patterns, :cached_votes_score
    add_index  :patterns, :cached_votes_up
    add_index  :patterns, :cached_votes_down
    add_index  :patterns, :cached_weighted_score

    # Uncomment this line to force caching of existing votes
    Pattern.find_each(&:update_cached_votes)
  end

  def self.down
    remove_column :patterns, :cached_votes_total
    remove_column :patterns, :cached_votes_score
    remove_column :patterns, :cached_votes_up
    remove_column :patterns, :cached_votes_down
    remove_column  :patterns, :cached_weighted_score
  end
end
