class StudentsController < ApplicationController
  before_action :require_login, only: [:show, :edit, :update]

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    @student.role = 'student'

    if @student.save 
      session[:student_id] = @student.id
      redirect_to student_dashboard_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @student = Student.find(params[:id])

    if current_student != @student && current_student.role != "admin"
      redirect_to root_path
    end
  end

  def edit
    @student = Student.find(params[:id])

    if current_student != @student && current_student.role != "admin"
      redirect_to root_path
    end
  end

  def update
    @student = Student.find(params[:id])

    if current_student != @student && current_student.role != "admin"
      redirect_to root_path
      return
    end

    if @student.update(update_student_params)
      redirect_to user_path(@student)
    else
      render :edit, status: :unprocessable_entity
    end
  end  




  private 

  def student_params 
    params.require(:student).permit(:name, :email, :password, :password_confirmation)
  end

  def update_student_params 
    params.require(:student).permit(:name, :email, :password, :password_confirmation)
  end
end
