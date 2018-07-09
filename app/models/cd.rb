class Cd < ApplicationRecord
	belongs_to :artist
	has_many :discs, :boughtitems, :cartitems
end
