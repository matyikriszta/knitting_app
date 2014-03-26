class Color < ActiveRecord::Base
  belongs_to :pattern
  attr_accessible :color, :pattern_id

  def self.get_default_colors
    
  end
end
