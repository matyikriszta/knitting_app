class Stitch < ActiveRecord::Base
  belongs_to :row, touch: true
  attr_accessible :color, :position, :type, :row_id
end
