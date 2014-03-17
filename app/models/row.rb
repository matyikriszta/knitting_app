class Row < ActiveRecord::Base
  belongs_to :pattern
  attr_accessible :no_of_stitches, :position, :pattern_id
end
