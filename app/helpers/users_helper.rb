module UsersHelper

		# Check if this user is the signed in user
		def correct_user
			@user = User.find(params[:id])
			redirect_to(root_url) unless current_user?(@user)
		end
		
end
