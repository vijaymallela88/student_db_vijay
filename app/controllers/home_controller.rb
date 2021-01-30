class HomeController < ApplicationController
  # skip_before_action :authenticate_user!, only: [:new, :create]
  # layout false, only: [:new, :create]
  def index
  	if user_signed_in?
  		redirect_to students_path
  	else	
  		redirect_to new_user_session_path
  		# redirect_to new_student_path
  	end
  end
end
