class Price < ApplicationRecord
  belongs_to :product
  has_one :tax

  enum price_type: {
    b2b: 0,
    b2c: 1,
    special_b2c: 2
  }
end