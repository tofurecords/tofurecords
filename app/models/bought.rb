class Bought < ApplicationRecord
	belongs_to :user#, optional: true
	has_many :boughtitems, dependent: :destroy

	enum status: { in_preparation: 0, shipped: 1, delivery_completed: 2}
	enum ship: { home: 0, new: 1, registered1: 2}, _suffix: true

	def total_price
		boughtitems.to_a.sum { |item| item.total_price }
	end

	default_scope -> { order(created_at: :desc) }
end
