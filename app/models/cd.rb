class Cd < ApplicationRecord
	belongs_to :artist, optional:true, inverse_of: :cds
	has_many :discs, inverse_of: :cd
	has_many :boughtitems
	has_many :cartitems
	accepts_nested_attributes_for :discs, reject_if: :all_blank, allow_destroy: true
	attachment :image

  enum genre: { J_pop: 0, Roock: 1, EDM: 2, Metal: 3, Jazz: 4, Classic: 5, Country: 6, Rap: 7 }


 def self.search(search) #self.でクラスメソッドとしている
    if search # Controllerから渡されたパラメータが!= nilの場合は、titleカラムを部分一致検索
       Cd.where(['genre LIKE ? OR title LIKE ?', "%#{search}%", "%#{search}%"])
    end
 end

	# 商品を破棄する際のフックメソッドを登録する
    # destroy()が実行される前に、Railsが自動的に実行する
    # 戻り値がfalseであれば、destroy()は実行されない
    # (リフレクションで呼出されるらしい)
    before_destroy :referenced_by_cartitem

    private

    def referenced_by_cartitem
      # 関連する品目が空でないか検証
      if cartitems.empty?
        return true
      else
        errors.add(:base, "品目が存在します")
        return false
      end
    end

end