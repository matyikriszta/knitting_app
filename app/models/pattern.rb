class Pattern < ActiveRecord::Base
  acts_as_votable

  belongs_to :user
  belongs_to :category
  belongs_to :difficulty
  has_many :rows
  has_many :stitches, through: :rows
  has_many :images

  accepts_nested_attributes_for :rows, allow_destroy: true

  attr_accessible :description, :equipment, :instructions, :name, :no_of_rows, :notes, :status, :yarn, :category_id, :user_id, :difficulty_id, :sequence, :rows_attributes
end
