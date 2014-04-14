class Pattern < ActiveRecord::Base
  acts_as_votable
  acts_as_commentable

  belongs_to :user
  belongs_to :category
  belongs_to :difficulty
  has_many :rows, :order => 'position ASC'
  has_many :stitches, through: :rows
  has_many :images
  has_many :colors

  accepts_nested_attributes_for :rows, allow_destroy: true
  accepts_nested_attributes_for :colors, allow_destroy: true

  before_validation :prepare_pattern

  attr_accessor :no_of_stitches, :yarn_gauge, :width_inch

  attr_accessible :description, :equipment, :instructions, :name, :no_of_rows, :notes, :status, :yarn, :category_id, :difficulty_id, :no_of_stitches, :yarn_gauge, :width_inch, :rows_attributes, :colors_attributes

  def prepare_pattern
    if yarn_gauge && width_inch
      gauge = yarn_gauge.to_i
      width = width_inch.to_i
      @no_of_stitches = gauge * width
      self.no_of_rows.to_i
      self.no_of_stitches.to_i
    end
  end

end
