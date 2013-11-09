class Post < ActiveRecord::Base
	belongs_to :user
	belongs_to :category

	acts_as_taggable

	extend FriendlyId
	friendly_id :slug

	# Specify the date order
	default_scope -> { order('created_at DESC') }

	# Validation
	validates :title, presence: true, length: { maximum: 100 }
	validates :content, presence: true
	validates :category_id, presence: { message: "Error | Please create a category before new post." }

	# Search
	include PgSearch
	# ()braket for lambda is needed somehow.
	pg_search_scope :search, (lambda do |query, against|
		{
			query: query,
			#using: {tsearch: { dictionary: "english" }},
			against: against[:this],
			associated_against: against[:aso]
		}
	end)
		
	def self.search_query_with_type(query, type)
		if query.present?
			case type
				when "posts"
					against = { this: [:title, :content], aso: { tags: [:name] } }
				# when "user"
					# against = { this: [], aso: { user: :user_name } }
					# Use this format
					#against = { this: [:field1, :field2], aso: { associated_model: [:field1, :field2] } }
			end
			search(query, against)
		else
			Post.all
		end
	end

end



