class Post < ApplicationRecord
  has_many :marks
  validates :title, presence: true, length: {minimum:5, maximum: 250}
  validates :description, presence: true, length: {minimum:5, maximum: 500}
end
