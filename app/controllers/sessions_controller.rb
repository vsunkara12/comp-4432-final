class SessionsController < ApplicationController
  def new
  end

  def create
    student = Student.find_by(email: params[:email])

    if student 
      if student.authenticate(params[:password])
        session[:student_id] = student.id
        redirect_to student_dashboard_path
      else
        flash[:notice] = "Password not valid"
        render :new
      end
    else 
      flash[:notice] = "User not found"
      render :new
    end
  end

  def destroy
    session[:student_id] = nil
    redirect_to root_path, notice: "Sign out successful"
  end
end
