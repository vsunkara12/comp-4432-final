class Assignment < ApplicationRecord
  #every assignment has a title and has a grade per student so many grades
  validates :title, presence: true
  has_many :grades, dependent: :destroy
  belongs_to :course
end
