class Favorite < ApplicationRecord
	belongs_to :user, :artist
end
