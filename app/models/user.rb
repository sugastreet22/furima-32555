class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, password_length: 6..128
  has_many :items
  with_options presence: true do
    validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: "is invalid. Password can't be blank"}
    validates :name, presence: true
    validates :lastname, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid. Last name can't be blank."}
    validates :firstname, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid. First name can't be blank."}
    validates :lastnamekana, format: { with: /\A[ァ-ヶー－]+\z/, message: "is invalid. Last name kana can't be blank."}
    validates :firstnamekana, format: { with: /\A[ァ-ヶー－]+\z/, message: "is invalid. First name kana can't be blank."}
    validates :birthday, presence: true
  end
end
