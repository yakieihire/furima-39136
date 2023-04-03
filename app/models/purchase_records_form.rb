class PurchaseRecordsForm
  include ActiveModel::Model
  attr_accessor :user, :item, :post_cord, :prefecture_id, :municipality, :address, :building_name, :telephone_number, :purchase_record

  validates :user, presence: true
  validates :item, presence: true
  
  validates :post_cord, presence: true
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :municipality, presence: true
  validates :address, presence: true
  validates :building_name, presence: true
  validates :telephone_number, presence: true
  validates :purchase_record, presence: true

  def save
    purchase_record = PurchaseRecord.create(user: user_id, item: item_id)

    shipping_address = ShippingAddress.create(post_cord: post_cord, prefecture_id: prefecture_id, municipality: municipality, address: address, building_name: building_name, telephone_number: telephone_number, purchase_record: purchase_record.id)
  end
end