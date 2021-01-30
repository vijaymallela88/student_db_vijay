class RegistrationsController < Devise::RegistrationsController
	
	def create
		@user = User.new(sign_up_params)
		if @user.save
           flash[:alert] = "User created successfully"
        else
           flash[:alert] = "Please enter valid log-in details"
	    end
	    redirect_to new_user_session_path
	end

	private
	def sign_up_params 
	  params.require(:user).permit(:name, :email, :password, :password_confirmation, :phone_number)
	end
	def account_update_params
	  params.require(:user).permit(:name, :email, :password, :password_confirmation, :current_password, :phone_number)
	end
end