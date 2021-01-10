class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, password_length: 6..128
  has_many :items
  has_many :orders
  with_options presence: true do
    validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: "is invalid. Password can't be blank" }
    validates :name, presence: true
    with_options format: { with: /\A[ぁ-んァ-ン一-龥]/ } do
    validates :lastname
    validates :firstname
    end
    with_options format: { with: /\A[ァ-ヶー－]+\z/ } do
    validates :lastnamekana
    validates :firstnamekana
    end
    validates :birthday, presence: true
  end
end