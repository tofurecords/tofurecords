class Cd < ApplicationRecord
	belongs_to :artist, optional:true, inverse_of: :cds
	has_many :discs, inverse_of: :cd
	has_many :boughtitems
	has_many :cartitems
	accepts_nested_attributes_for :discs, reject_if: :all_blank, allow_destroy: true
	attachment :image
	enum genre: { j_pop:0, roock:1 }

	# 商品を破棄する際のフックメソッドを登録する
    # destroy()が実行される前に、Railsが自動的に実行する
    # 戻り値がfalseであれば、destroy()は実行されない
    # (リフレクションで呼出されるらしい)
    before_destroy :referenced_by_line_item

    private

    def referenced_by_any_line_item
      # 関連する品目が空でないか検証
      if line_items.empty?
        return true
      else
        errors.add(:base, "品目が存在します")
        return false
      end
    end
end
