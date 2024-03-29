class Category < ActiveRecord::Base
	
	has_many :posts
	belongs_to :user

	extend FriendlyId
	friendly_id :slug

	default_scope -> { order(:order) }

	# Validation
	validates :name, presence: true
	validates :slug, presence: true, uniqueness: true

end
