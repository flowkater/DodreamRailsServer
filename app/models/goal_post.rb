class GoalPost < ActiveRecord::Base
	belongs_to :user
  belongs_to :goal
  default_scope order: 'updated_at DESC'
  has_many :comments

  has_many :pictures, as: :imageable, dependent: :destroy

  accepts_nested_attributes_for :pictures
end
