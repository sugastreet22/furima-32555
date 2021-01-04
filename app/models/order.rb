class Order < ApplicationRecord
  belong_to :user
  belong_to :item
  has_one :address
end
