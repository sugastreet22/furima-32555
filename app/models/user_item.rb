class UserItem
  include ActiveModel::Model
  attr_accessor :item, :user, :postal, :area_id, :city, :block, :building, :number, :purchase

  with_options presence: true do
    
    # 「住所」の郵便番号に関するバリデーション
    validates :postal, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
    
  end
  # 「住所」の都道府県に関するバリデーション
  validates :area_id, numericality: { other_than: 0, message: "can't be blank" }
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is out of setting range" }

  def save
    # ユーザーの情報を保存し、「user」という変数に入れている
    user = User.create(name: name, name_reading: name_reading, nickname: nickname)
    # 住所の情報を保存
    Address.create(postal: postal, area_id: area_id, city: city, block: block, building: building, number: number, purchase: purchase user_id: user.id)
    # 寄付金の情報を保存
    Item.create(price: price, user_id: user.id)
  end
end