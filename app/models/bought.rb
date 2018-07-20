class Bought < ApplicationRecord
	belongs_to :user#, optional: true
	has_many :boughtitems, dependent: :destroy

	def total_price
		boughtitems.to_a.sum { |item| item.total_price }
	end

	default_scope -> { order(created_at: :desc) }
end
