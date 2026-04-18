class Enrollment < ApplicationRecord
  #validation to ensure that each student is only enrolled in their respective course one time using their id and the course id

  validates :student_id, uniqueness: {scope: :course_id}
  belongs_to :student
  belongs_to :course
end