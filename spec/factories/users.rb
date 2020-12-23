FactoryBot.define do
  factory :user do
    name { Faker::Name.last_name }
    email { Faker::Internet.free_email }
    password = Faker::Internet.password(min_length: 6)
    password { password }
    password_confirmation { password }
    lastname { '高橋' }
    firstname { '秀樹' }
    lastnamekana { 'タカハシ' }
    firstnamekana { 'ヒデキ' }
    birthday { '2020-02-02' }
  end
end
