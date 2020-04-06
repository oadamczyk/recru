module ProductServices
  class Calculator
    def initialize(product: product)
      @product = product
    end

    def call
      product.prices.each do |price|
        if price.b2b?
          B2bCalculator.calculate_price(price)
        elsif price.b2c?
          B2cCalculator.call(price)
        elsif price.special_b2c?
          SpecialB2cCalculator.calc(price)
        end
      end

      product.reload
    end

    private

    attr_reader :product
  end
end