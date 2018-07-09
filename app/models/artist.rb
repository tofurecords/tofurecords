class Artist < ApplicationRecord

	has_many :cds, :favorites

end
