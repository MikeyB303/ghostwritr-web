class Work < ApplicationRecord
  belongs_to :author, class_name: 'Author'
end
