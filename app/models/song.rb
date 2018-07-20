class Song < ApplicationRecord
	belongs_to :disc, inverse_of: :songs


def self.search(search) #self.でクラスメソッドとしている
    if search # Controllerから渡されたパラメータが!= nilの場合は、titleカラムを部分一致検索
    	Song.where(['name LIKE ?', "%#{search}%"])


    end
end
end