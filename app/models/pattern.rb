class Pattern < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  attr_accessible :description, :difficulty, :equipment, :instructions, :name, :no_of_rows, :notes, :status, :yarn, :category_id, :user_id
end
