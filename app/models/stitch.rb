class Stitch < ActiveRecord::Base
  belongs_to :row
  attr_accessible :color, :position, :type, :row_id
end
