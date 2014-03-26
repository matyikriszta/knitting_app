class Color < ActiveRecord::Base
  belongs_to :pattern
  attr_accessible :color
end
