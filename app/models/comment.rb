class Comment < ApplicationRecord
	belongs_to :post
	belongs_to :commenter, class_name: "User"
	has_many :votes, as: :votable

	validates :body, :post_id, :commenter_id, presence: true
end
