module ProductServices
  class SpecialB2cCalculator
    def self.calc(price)
      price.update!(
        price: (price.unit_gross + price.unit_gross * special).round
      )
    end

    def self.special
      Setting.first.special
    end
  end
end