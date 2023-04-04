class OrderForm
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_cord, :prefecture_id, :municipality, :address, :building_name, :telephone_number

  with_options presence: true do
    validates :post_cord, :prefecture_id, :municipality, :address
    validates :prefecture_id, numericality: { other_than: 1}
    validates :post_cord, format: { with: /\A[0-9]{3}-[0-9]{4}\z/}
    validates :telephone_number, format: { with: /\A[0-9]{11}\z/}
    
  end


  def save
    purchase_record = PurchaseRecord.create(user_id: user_id, item_id: item_id)
    ShippingAddress.create(post_cord: post_cord, prefecture_id: prefecture_id, municipality: municipality, address: address, building_name: building_name, telephone_number: telephone_number, purchase_record_id: purchase_record.id)
  end
end