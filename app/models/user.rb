class User < ApplicationRecord
	has_secure_password
	has_many :posts, foreign_key: :author_id
	has_many :votes, foreign_key: :voter_id
	has_many :comments, foreign_key: :commenter_id

	validates :username, :email, :password_digest, presence: true
    validates :email, uniqueness: true
end
