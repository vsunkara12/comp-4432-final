class FlawedController < ApplicationController
  before_action :require_login

  def show_grade
    @grade = Grade.find(params[:id])
  end

  def admin
    @students = Student.all
  end

  def students_edit
    @student = Student.find(params[:id])
  end

  def students_update
    @student = Student.find(params[:id])

    if @student.update(flawed_student_params)
      redirect_to user_path(@student)
    else
      render :students_edit, status: :unprocessable_entity
    end

  end

  private

  def flawed_student_params
    params.require(:student).permit(:name, :email, :password, :password_confirmation, :role)
  end
end
