class Pattern < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  belongs_to :difficulty
  attr_accessible :description, :equipment, :instructions, :name, :no_of_rows, :notes, :status, :yarn, :category_id, :user_id, :difficulty_id
end
