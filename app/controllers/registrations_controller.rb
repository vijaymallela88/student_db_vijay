class RegistrationsController < Devise::RegistrationsController
	
	def create
		@user = User.new(sign_up_params)
		if @user.save
           flash[:alert] = "User created successfully"
	       redirect_to new_user_session_path
        else
           flash[:alert] = "Please enter valid log-in details"
           redirect_to new_user_registration_path
	    end
	end

	private
	
	def sign_up_params 
	  params.require(:user).permit(:name, :email, :password, :password_confirmation, :phone_number)
	end

	def account_update_params
	  params.require(:user).permit(:name, :email, :password, :password_confirmation, :current_password, :phone_number)
	end
end