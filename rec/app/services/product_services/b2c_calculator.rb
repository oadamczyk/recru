module ProductServices
  class B2cCalculator
    def self.call(price)
      ApplicationRecord.transaction do
        price.update!(
          unit_gross: b2c_data[:gross],
          unit_net: b2c_data[:net],
          price: (b2c_data[:gross] + b2c_data[:gross] * b2c_data[:margin]).round
        )

        price.tax.update!(
          value: price.unit_gross - price.unit_net
        )
      end
    end

    def self.b2c_data
      ExternalCatalogClient.new.b2c_data
    end
  end
end