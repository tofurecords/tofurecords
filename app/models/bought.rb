class Bought < ApplicationRecord
	belongs_to :user
	has_many :boughtitems
end
