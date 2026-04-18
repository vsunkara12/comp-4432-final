class AdminController < ApplicationController
  before_action :require_login

  def index
    if current_student.role != 'admin'
      redirect_to root_path
      return
    end

    @students = Student.all
  end
end
