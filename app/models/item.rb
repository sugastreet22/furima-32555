class Item < ApplicationRecord
  belongs_to :user
  with_options presence: true do
    validates :product
    validates :explain
    validates :category_id
    validates :condition_id
    validates :burdrn_id
    validates :area_id
    validates :day_id
    validates :price
    validates :user
  end
end

