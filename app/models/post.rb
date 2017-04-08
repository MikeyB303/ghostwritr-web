class Post < ApplicationRecord
	belongs_to :author, class_name: "User"
	has_many :comments
	has_many :votes

	validates :title, :text, :author_id, presence: true
end
