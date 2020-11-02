FactoryBot.define do
  factory :company do
    company_name          {Faker::Lorem.word}
    email                 {Faker::Internet.free_email}
    password              {'abcd1234'}
    password_confirmation {password}
    phone_number          {'09012345678'}
    office_url            {Faker::Internet.url}
    staff_lastname_kana   {'ヤマダ'}
    staff_firstname_kana  {'タロウ'}
    detail                {Faker::Lorem.sentence}
  end
end
