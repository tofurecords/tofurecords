class Cd < ApplicationRecord
	belongs_to :artist, optional:true, inverse_of: :cds
	has_many :discs, inverse_of: :cd
	has_many :boughtitems
	has_many :cartitems
	accepts_nested_attributes_for :discs, reject_if: :all_blank, allow_destroy: true
	attachment :image
	enum genres: { j_pop: 0, roock: 1 }

 def self.search(search) #self.でクラスメソッドとしている
    if search # Controllerから渡されたパラメータが!= nilの場合は、titleカラムを部分一致検索
    	Cd.where(['title LIKE ?', "%#{search}%"])

    end
end
end