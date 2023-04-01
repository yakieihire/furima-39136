class ShippingDay < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '1~2日までに発送' },
    { id: 3, name: '2~3日までに発送' },
    { id: 4, name: '4~7日までに発送' },
  ]
  include ActiveHash::Associations
  has_many :items
end
