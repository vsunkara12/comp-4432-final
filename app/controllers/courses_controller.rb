class CoursesController < ApplicationController
  before_action :require_login

  def index
    if current_student.role == "admin"
      @courses = Course.all
    elsif current_student.role == "teacher"
      @courses = current_student.courses
    else 
      @courses = current_student.enrolled_courses
    end
  end

  def show
    @course = Course.find(params[:id])

    if current_student.role == "admin"
    elsif current_student.role == "teacher" && @course.student == current_student
    elsif current_student.role == "student" && @course.students.include?(current_student)
    else 
      redirect_to student_dashboard_path
      return
    end

    @assignments = @course.assignments


  end
end
