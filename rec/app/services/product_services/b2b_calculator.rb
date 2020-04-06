module ProductServices
  class B2bCalculator
    B2B_MARGIN = 0.1

    def self.calculate_price(price)
      price.update!(
        price: (price.unit_net + price.unit_net * B2B_MARGIN).round
      )
    end
  end
end