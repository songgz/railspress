class CategoriesController < ApplicationController
	before_action :signed_in_user, only: [:index, :new, :edit, :create, :update, :destroy]
	before_action :if_owner, only: [:edit, :update, :destroy]

	def index
		@categories = Category.where("user_id=?", current_user)
	end

#### ↓↓↓ Need sign in ↓↓↓ ####

	def new
		@category = current_user.categories.build
	end

	def edit
	end

	def create
		@category = current_user.categories.build(strong_params)
		if @category.save
			flash[:info] = "Saved!"
			redirect_to categories_path
		else
			render 'new'
		end
	end

	def update
		@category.attributes = strong_params
		if @category.save
			flash[:info] = "Saved!"
			redirect_to categories_path
		else
			render 'new'
		end
	end

	def destroy
		@category.destroy
		flash[:info] = "Deleted."
		redirect_to categories_path
	end

	def show_in_category
		@cagegory = Category.friendly.find(params[:id])
		@posts = @cagegory.posts.where("published=?", true).paginate(page: params[:page], per_page: 10)
		render 'posts/index', locals: { category: @cagegory }
	end

#### ↓↓↓ Private function ↓↓↓ ####

	private

		def strong_params
			params.require(:category).permit(:id, :user_id, :name, :slug, :menu, :order)
		end

		# Check if the user is the owner.
		def if_owner
			@category = current_user.categories.friendly.find(params[:id])
			redirect_to signin_path if @category.nil?
		end



end
