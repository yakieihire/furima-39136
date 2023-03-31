class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :situation
  belongs_to :shipping_payer
  belongs_to :prefecture
  belongs_to :shipping_day

  validates :item_name, presence: true
  validates :description, presence: true
  validates :category_id, numericality: { other_than: 1, message: "can't be blank"} 
  validates :situation_id, numericality: { other_than: 1, message: "can't be blank"} 
  validates :shipping_payer_id, numericality: { other_than: 1, message: "can't be blank"} 
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank"} 
  validates :shipping_day_id, numericality: { other_than: 1, message: "can't be blank"} 
  validates :price, presence:true
end
