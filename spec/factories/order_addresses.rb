FactoryBot.define do
  factory :order_address do
    postal_code { '854-0001' }
    prefecture_id { 42 }
    city { '諫早市福田町' }
    house_number { '18-23' }
    building_name { 'アーバンハウス' }
    phone_number { '09011111111' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
