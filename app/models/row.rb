class Row < ActiveRecord::Base
  belongs_to :pattern
  has_many :stitches, :order => 'position ASC'

  accepts_nested_attributes_for :stitches, allow_destroy: true

  attr_accessor :no_of_stitches, :width_inch

  attr_accessible :no_of_stitches, :position, :pattern_id, :stitches_attributes
end
