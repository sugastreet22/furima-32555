FactoryBot.define do
  factory :user_item do
    token {"tok_abcdefghijk00000000000000000"}
    postal { '123-4567' }
    area_id { 2 }
    city { '東京都' }
    block { '1-1' }
    building { 'キャロットタワー' }
    number { '09000000000' }
    user_id { 1 }
    item_id { 1 }
  end
end