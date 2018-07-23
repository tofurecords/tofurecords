class Artist < ApplicationRecord

	has_many :cds, inverse_of: :artist, dependent: :destroy
	has_many :favorites, dependent: :destroy
	accepts_nested_attributes_for :cds

	attachment :image

	def self.search(search) #self.でクラスメソッドとしている
	    if search # Controllerから渡されたパラメータが!= nilの場合は、titleカラムを部分一致検索
	    	Artist.where(['name LIKE ?', "%#{search}%"])
	    end
	end

end
