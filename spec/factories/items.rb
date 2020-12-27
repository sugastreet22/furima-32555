FactoryBot.define do
  factory :item do
    product {Faker::Lorem.sentence}     
    explain {Faker::Lorem.sentence}     
    category_id {2} 
    condition_id {2}
    burden_id {2} 
    area_id {22}     
    day_id {2}      
    price {301}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
