FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.last_name}
    email                 {Faker::Internet.free_email}
    password              {'abcd1234'}
    password_confirmation {password}
    phone_number          {'09012345678'}
    detail                {Faker::Lorem.sentence}
  end
end
