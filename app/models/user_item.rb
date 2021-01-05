class UserItem
  include ActiveModel::Model
  attr_accessor :item, :user, :postal, :area_id, :city, :block, :building, :number, :order

  with_options presence: true do
    validates :postal, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
    validates :area_id, numericality: { other_than: 1, message: "Prefecture Select" }
    validates :city
    validates :block
    validates :number, format: { with: /\A\d{10,11}\z/, message: "Phone number can't be blank" }
  end

  def save
    Address.create(item: item, user: user, postal: postal, area_id: area_id, city: city, block: block, building: building, number: number, order: order, user_id: user.id)
  end

end