class ApplicationController < ActionController::Base
    helper_method :current_student


    def current_student
        Student.find_by(id: session[:student_id])   #creating a helper method for later use in controllers/views
    end

    def require_login
        if !current_student
            redirect_to signin_path
        end
    end
end
