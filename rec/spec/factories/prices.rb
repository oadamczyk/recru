FactoryBot.define do
  factory :price do
    price { 132 }
    price_type { :b2b }
    product { create(:product, :buyable, :without_prices) }
    tax { build(:tax, :without_price) }
    unit_gross { 120 }
    unit_net { 100 }

    trait :b2c do
      price_type { :b2c }
    end

    trait :not_buyable do
      price { nil }
      product { create(:product, :not_buyable, :without_prices) }
    end

    trait :promo do
      price_type { :promo }
    end

    trait :special_b2c do
      price_type { :special_b2c }
    end

    trait :without_product do
      product { nil }
    end

    trait :without_tax do
      tax { nil }
    end
  end
end
