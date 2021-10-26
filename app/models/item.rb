class Item < ApplicationRecord

  attachment :image
  has_many :cart_items, dependent: :destroy
  has_many :order_items, dependent: :destroy
  belongs_to :genre


# 消費税の計算
  def add_tax_price
    (self.price * 1.1).round
  end

  # 検索機能
  def self.search(keyword)
    @items = Item.where("item_name LIKE ?", "%#{keyword}%")
  end


  validates :image, presence: true
  validates :item_name, presence: true
  validates :introduction, presence: true
  validates :genre_id, presence: true
  validates :price, presence: true
  validates :is_status, presence: true

end
