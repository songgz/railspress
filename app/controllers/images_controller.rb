class ImagesController < ApplicationController

	before_action :signed_in_user,	only: [:create, :get_existing]
	before_action :correct_user,	  only: [:get_existing]

	def create
		@image = current_user.images.create(strong_params)
	end

	def get_existing
		items_per_page = 9
		items_per_page = 10 if params[:page].to_i >= 2
		@existing_images = Image.where("user_id=?", params[:id]).paginate(page: params[:page], per_page: items_per_page)
	end

	private
		def strong_params
			params.require(:image).permit(
						:user_id, :url, :alt)
		end

end
