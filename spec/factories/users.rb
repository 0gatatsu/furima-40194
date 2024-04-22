FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.email }
    password              { '1a' + Faker::Internet.password(min_length: 4) }
    password_confirmation { password }
    first_name_kanji      { '漢字' }
    last_name_kanji       { '漢字' }
    first_name_kana       { 'カタカナ' }
    last_name_kana        { 'カタカナ' }
    birthday              { Faker::Date.birthday }
  end
end
