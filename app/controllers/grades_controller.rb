class GradesController < ApplicationController
  before_action :require_login

  def index
    if current_student.role == 'admin'
      @grades = Grade.all
    elsif current_student.role == 'teacher'
      @grades = []

      current_student.courses.each do |course|
        course.assignments.each do |assignment|
          assignment.grades.each do |grade|
            @grades << grade 
          end
        end
      end
    else 
      @grades = current_student.grades
    end
  end

  def show
    @grade = Grade.find(params[:id])

    if current_student.role == 'admin'
    elsif @grade.student == current_student
    elsif current_student.role == 'teacher' && @grade.assignment.course.student == current_student
    else  
      redirect_to grades_path
    end
  end
end
