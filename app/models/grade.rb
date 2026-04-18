class Grade < ApplicationRecord
  #every grade must have a score of course
  validates :score, presence: true

  belongs_to :student
  belongs_to :assignment
end
