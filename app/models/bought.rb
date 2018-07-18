class Bought < ApplicationRecord
	belongs_to :user#, optional: true
	has_many :boughtitems, dependent: :destroy

end
