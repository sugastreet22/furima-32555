class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :burden
  belongs_to :area
  belongs_to :day
  belongs_to :user
  has_one_attached :image
  with_options presence: true do
    validates :product
    validates :explain
    validates :category_id
    validates :condition_id
    validates :burden_id
    validates :area_id
    validates :day_id
    with_options format: { with: /\A[0-9]+\z/ } do
    validates :price
    end
    validates :user
    validates :image
  end
  validates :category_id, numericality: { other_than: 1 } 
  validates :condition_id, numericality: { other_than: 1 } 
  validates :burden_id, numericality: { other_than: 1 } 
  validates :area_id, numericality: { other_than: 1 } 
  validates :day_id, numericality: { other_than: 1 } 
  validates :price, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
end

