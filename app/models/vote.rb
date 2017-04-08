class Vote < ApplicationRecord
	belongs_to :post
	belongs_to :voter, class_name: "User"

	validates :voter_id, :post_id, presence: true
end
