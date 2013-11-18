class SessionsController < ApplicationController

	def create
		user = User.find_by(email: params[:session][:email].downcase)
		# Checking email and password
		if user && user.authenticate(params[:session][:password])
			# If success, create new token in db an browser cookie
			# If remember_me, cookie expiry will be parmanent
			sign_in user, params[:session][:remember_me]
			# Take session[:return_to] if exists. Otherwise take default.
			redirect_back_or user
		else
			flash.now[:warning] = "Invalid email/password combination"
			render 'new'
		end
	end

	def destroy
		sign_out
		redirect_to signin_url
	end

end
