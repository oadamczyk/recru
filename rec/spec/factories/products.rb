FactoryBot.define do
  factory :product do
    buyable { true }
    description { 'Test desc' }
    sequence :identifier do |n|
      "12345#{n}"
    end
    name { 'Test name' }
    prices { build_list(:price, 1, :without_product) }

    trait :not_buyable do
      buyable { false }
      description { nil }
      name { nil }
    end

    trait :without_prices do
      buyable { false }
      prices { [] }
    end
  end
end
