class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items
  # VALID_PASSWORD_REGEX = /\A[a-z0-9]+\z/i
  # validates :password, format: { with: VALID_PASSWORD_REGEX }
  # validates :name, presence: true
  # validates :lastname, presence: true
  # validates :firstname, presence: true
  # validates :lastnamekana, presence: true
  # validates :firstnamekana, presence: true
  # validates :birthday, presence: true
end
