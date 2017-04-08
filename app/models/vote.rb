class Vote < ApplicationRecord
	belongs_to :post
	belongs_to :voter, class_name: "User"
	belongs_to :votable, polymorphic: true

	validates :voter_id, :votable_id, presence: true
end
