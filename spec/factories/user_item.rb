FactoryBot.define do
  factory :user_item do
    token {"tok_abcdefghijk00000000000000000"}
    postal { '123-4567' }
    area_id { 1 }
    city { '東京都' }
    block { '1-1' }
    number { '09000000000' }
  end
end