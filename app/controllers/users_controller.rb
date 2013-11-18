class UsersController < ApplicationController

	# Add ':new' and ':create ' if you don't want a new user
	before_action :signed_in_user,	only: [:index, :show, :edit, :update, :destroy]
	before_action :correct_user,	only: [:edit, :update]
	before_action :admin_user,		only: [:destroy]

	def index
		@users = User.paginate(page: params[:page])
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			sign_in @user
			flash[:success] = "Welcome!"
			redirect_to @user
		else
			render 'new'
		end
	end

	def show
		@user = User.find(params[:id])
		@posts = @user.posts.paginate(page: params[:page], per_page: 10)
	end

#### ↓↓↓ Need sign in ↓↓↓ ####

	def edit
	end

	def update
		@user.attributes = user_params
		if @user.save(context: :updating)
			flash[:success] = "Profile updated"
			sign_in @user
			redirect_to @user
		else
			render 'edit'
		end
	end

	def destroy
		User.find(params[:id]).destroy
		flash[:success] = "User deleted."
		redirect_to users_path
	end

#### ↓↓↓ Private function ↓↓↓ ####

	private

		def user_params
			params.require(:user).permit(:user_name, :email,
										:password, :password_confirmation)
		end

end


