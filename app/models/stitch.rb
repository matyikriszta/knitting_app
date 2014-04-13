class Stitch < ActiveRecord::Base
  belongs_to :row, touch: true
  attr_accessible :color, :position, :stitch_symbol, :row_id
end
