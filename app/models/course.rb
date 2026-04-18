class Course < ApplicationRecord
  #validation every course must have their course title
  validates :title, presence: true

  #relations courses have many students enrolled which makes sure students can only see the courses they are enrolled in, and each course has many assignments  
  belongs_to :student
  has_many :enrollments, dependent: :destroy
  has_many :students, through: :enrollments
  has_many :assignments, dependent: :destroy
end
