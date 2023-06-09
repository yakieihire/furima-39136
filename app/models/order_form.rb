class OrderForm
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :prefecture_id, :municipality, :address, :building_name, :telephone_number, :token

  with_options presence: true do
    validates :token
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "は空白にしないでください"}
    validates :prefecture_id, numericality: { other_than: 1, message: "は空白にしないでください"}
    validates :municipality
    validates :address
    validates :telephone_number, format: { with: /\A\d{10,11}\z/, message: "は空白にしないでください"}
    validates :user_id
    validates :item_id
  end


  def save
    purchase_record = PurchaseRecord.create(user_id: user_id, item_id: item_id)
    ShippingAddress.create(post_code: post_code, prefecture_id: prefecture_id, municipality: municipality, address: address, building_name: building_name, telephone_number: telephone_number, purchase_record_id: purchase_record.id)
  end
end