class Mark < ApplicationRecord
  belongs_to :post
  validates :points, presence: true, numericality: {more_than_or_equal_to: 0, less_than_or_equal_to: 100,  only_integer: true }

  before_save :set_letter
  private def set_letter
    case self.points
    when 0..29
      self.letter ||= 'F'
    when 30..59
      self.letter ||= 'D'
    when 60..74
      self.letter ||= 'C'
    when 75..90
      self.letter ||= 'B'
    when 91..100
      self.letter ||= 'A'
    end
  end
end
