class Angelship < ActiveRecord::Base
	attr_accessible :dreamer_id

	belongs_to :angel, class_name: "User"
	belongs_to :dreamer, class_name: "User"

	validates :angel_id, presence: true
	validates :dreamer_id, presence: true
end
