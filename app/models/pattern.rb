class Pattern < ActiveRecord::Base
  acts_as_votable

  belongs_to :user
  belongs_to :category
  belongs_to :difficulty
  has_many :images

  attr_accessible :description, :equipment, :instructions, :name, :no_of_rows, :notes, :status, :yarn, :category_id, :user_id, :difficulty_id
end
