class Favorite < ApplicationRecord
	belongs_to :user
	belongs_to :artist

	validates :artist_id, :uniqueness => {:scope => :user_id}
	# validates :user_id, :uniqueness => {:scope => :article_id}

end
