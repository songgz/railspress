module SessionsHelper

	def sign_in(user, remember_me = "0")
		# Create new token
		remember_token = User.new_token
		# Set browser cookie
		# If expiry is needed, user below.
		# cookies[:remember_token] = { value: remember_token, expires: 20.years.from_now.utc }
		# without expriry, the cookie will be deleted when browser session finish.
		if remember_me == "1"
			cookies.permanent[:remember_token] = remember_token
		else
			cookies[:remember_token] = remember_token
		end
		# Update db
		user.update_attribute(:remember_token, User.encrypt(remember_token))
		# Set the user as current_user
		# You can access current_user from controller and view
		self.current_user = user
	end

	def current_user=(user)
		@current_user = user
	end

	# set current_user
	def current_user
		remember_token = User.encrypt(cookies[:remember_token])
		@current_user ||= User.find_by(remember_token: remember_token)
	end

	def signed_in?
		!current_user.nil?
	end

	def sign_out
		self.current_user = nil
		cookies.delete(:remember_token)
	end

	def current_user?(user)
		user == current_user
	end

	def redirect_back_or(default)
		# Take session[:return_to] if exists. Otherwise take default.
		redirect_to(session[:return_to] || default)
		session.delete(:return_to)
	end

	def store_location
		session[:return_to] = request.url
	end

	#### Authorization ###
	#### before_action ###

	def signed_in_user
		unless signed_in?
			store_location
			flash[:warning] = "Please sign in."
			redirect_to signin_url
		end
	end

	def admin_user
		redirect_to(root_url) unless current_user.admin?
	end

end
