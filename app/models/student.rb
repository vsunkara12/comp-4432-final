class Student < ApplicationRecord
    has_secure_password

    #validations for input name is required, email is required, and we must know whether they are a student, teacher, or admin
    validates :name, presence: true
    validates :email, presence: true, uniqueness: true
    validates :role, presence: true 
    
    
    
    
    #all the relations
    
    has_many :courses, dependent: :destroy #every student has many courses 
    has_many :grades,  dependent: :destroy #every student has many grades
    has_many :enrollments, dependent: :destroy #every student is enrolled in many classes
    has_many :enrolled_courses, through: :enrollments, source: :course  #the enrollments allows students to see every course they have and allows for later access control
end
