class Author < ApplicationRecord
  has_many :works
  
  validates :name, uniqueness: true
end
