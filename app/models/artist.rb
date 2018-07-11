class Artist < ApplicationRecord

	has_many :cds, inverse_of: :artist
	has_many :favorites
	accepts_nested_attributes_for :cds

	attachment :image

end
