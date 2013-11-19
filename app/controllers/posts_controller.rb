class PostsController < ApplicationController
	before_action :signed_in_user, only: [:new, :edit, :create, :update, :destroy]
	before_action :if_owner, only: [:edit, :update, :destroy]

	def index
		if params[:tag]
			@posts = Post.tagged_with(params[:tag]).where("published=?", true).paginate(page: params[:page], per_page: 10, total_entries: 80)
		else
			@posts = Post.where("published=?", true).paginate(page: params[:page], per_page: 10)
		end
	end

	def show
		@post = Post.friendly.find(params[:id])
		# Related posts with in tags
		@related_posts = Post.tagged_with(@post.tag_list, :any => true).limit(10)
		# Pickup posts in the category
		@pickup_posts = Post.where("pickup=?", true).where("category_id=?", @post.category).limit(5)
	end


#### ↓↓↓ Need sign in ↓↓↓ ####

	def new
		@post = current_user.posts.build
	end

	def edit
	end

	def create
		if params[:new_post]
			status = true
		end
		@post = current_user.posts.build(strong_params)
		@post.published = status
		@post.slug = nil if @post.slug == ''
		if @post.save
			if status == true
				create_sitemap # Recreate sitemap and send it.
			end
			flash[:info] = "Saved!"
			redirect_to user_path(current_user)
		else
			render 'new'
		end
	end

	def update
		@post.attributes = strong_params
		@post.slug = nil if @post.slug == ''
		if @post.save
			flash[:info] = "Saved!"
			redirect_to user_path(current_user)
		else
			render 'new'
		end
	end

	def destroy
		flash[:info] = "Deleted."
		@post.destroy
		create_sitemap # Recreate sitemap and send it.
		redirect_to user_path(current_user)
	end



#### ↓↓↓ Private function ↓↓↓ ####

	private

		def strong_params
			params.require(:post).permit(:id, :user_id, :category_id,
				:slug, :title, :content, :published, :tag_list)
		end

		# Check if the user is the owner.
		def if_owner
			@post = current_user.posts.friendly.find(params[:id])
			redirect_to root_url if @post.nil?
		end



end
