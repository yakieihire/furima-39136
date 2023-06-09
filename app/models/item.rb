class Item < ApplicationRecord
  belongs_to :user
  has_one :purchase_record
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :situation
  belongs_to :shipping_payer
  belongs_to :prefecture
  belongs_to :shipping_day

  validates :image, presence: true
  validates :item_name, presence: true
  validates :description, presence: true
  validates :category_id, numericality: { other_than: 1, message: "は空白にしないでください" }
  validates :situation_id, numericality: { other_than: 1, message: "は空白にしないでください" }
  validates :shipping_payer_id, numericality: { other_than: 1, message: "は空白にしないでください" }
  validates :prefecture_id, numericality: { other_than: 1, message: "は空白にしないでください" }
  validates :shipping_day_id, numericality: { other_than: 1, message: "は空白にしないでください" }
  validates :price, presence: true,
                    numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
end
