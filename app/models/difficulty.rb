class Difficulty < ActiveRecord::Base
  has_many :patterns
  attr_accessible :name
end
