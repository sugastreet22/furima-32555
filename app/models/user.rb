class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, password_length: 6..128
  has_many :items

  validates :name, presence: true
  validates :lastname, presence: true
  validates :firstname, presence: true
  validates :lastnamekana, presence: true
  validates :firstnamekana, presence: true
  validates :birthday, presence: true
end
