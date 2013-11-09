class PasswordResetsController < ApplicationController

	def new
	end

	def create
		user = User.find_by(email: params[:email])
		if user
			user.send_password_reset
			flash[:success] = "Email sent with password reset URL. Please check it."
			redirect_to root_url
		else
			flash[:warning] = "The email address does not exist."
			redirect_to new_password_reset_path
		end
	end

	def edit
		@user = User.find_by(password_reset_token: params[:id])
		redirect_to root_url unless @user
	end

	def update
		@user = User.find_by(password_reset_token: params[:id])
		if @user.password_reset_sent_at < 2.hours.ago
			flash[:warning] = "Password reset has expired."
			redirect_to new_password_reset_path
		else
			@user.attributes = user_params
			if @user.save(context: :password_updating)
				flash[:success] = "Password has been reset."
				redirect_to signin_path
			else
				render 'edit'
			end
		end
	end

#### ↓↓↓ Private function ↓↓↓ ####

	private
		# Define permitted variables for security
		def user_params
			params.require(:user).permit(:password, :password_confirmation)
		end

end
