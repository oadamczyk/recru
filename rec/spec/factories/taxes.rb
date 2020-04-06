FactoryBot.define do
  factory :tax do
    value { 100 }
    price { build(:price, :without_tax) }

    trait :without_price do
      price { nil }
    end
  end
end
