class SearchesController < ApplicationController

	def posts
		type = "posts"
# type for 'search_query_with_type' method,
#		if params.include?(:type)
#			type = params[:type]
#			session[:search_type] = params[:type]
#		else
#			type = "all"
#			session[:search_type] = "all"
#		end

# Narrowing depending on Area
#		country_ids = []
#		if params.include?(:area) && !(params[:area] == "0")
#			countries = Country.where("area_id=?", params[:area])
#			countries.each do |c|
#				country_ids.push c["id"]
#			end
#			@posts = Recipe.search_query_with_type(params[:query], type).where(country_id: country_ids).paginate(page: params[:page], per_page: 10)
#			session[:search_area] = params[:area]
#		else
#			# Without 'where'
#			@posts = Recipe.search_query_with_type(params[:query], type).paginate(page: params[:page], per_page: 10)
#			session[:search_area] = 0
#		end
		@posts = Post.search_query_with_type(params[:query], type).paginate(page: params[:page], per_page: 10)
		render 'posts/index'
	end

#### ↓↓↓ Private function ↓↓↓ ####
	
	private


end
