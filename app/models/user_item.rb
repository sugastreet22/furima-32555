class UserItem
  include ActiveModel::Model
  attr_accessor :token, :postal, :area_id, :city, :block, :building, :number, :user_id, :item_id, :order_id

  with_options presence: true do
    validates :postal, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
    validates :area_id, numericality: { other_than: 1, message: "Prefecture Select" }
    validates :city
    validates :block
    validates :number, format: { with: /\A\d{10,11}\z/, message: "Phone number can't be blank" }
    validates :user_id
    validates :item_id
    validates :token
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal: postal, area_id: area_id, city: city, block: block, building: building, number: number, order_id: order.id)
  end

end