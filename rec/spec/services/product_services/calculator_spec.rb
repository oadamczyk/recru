require 'rails_helper'

RSpec.describe ProductServices::Calculator do
  before do
    allow_any_instance_of(ProductServices::ExternalCatalogClient)
      .to receive(:b2c_data).with(no_args).and_return(
        gross: 200,
        margin: 0.5,
        net: 160
      )
  end
  let!(:setting) { create(:setting, special: 0.33) }
  let!(:product) { create(:product, :without_prices) }
  let(:prices) do
    {
      b2b: create(:price, product: product, price: nil),
      b2c: create(:price, :b2c, product: product, price: nil),
      special_b2c: create(:price, :special_b2c, product: product, price: nil)
    }
  end

  it 'recalculates prices properly' do
    expect do
      described_class.new(product: product.reload).call
    end.to change { prices[:b2b].reload.price }.from(nil).to((1.1 * prices[:b2b].unit_net).round)
             .and change { prices[:b2c].reload.price }.from(nil).to((200 * (1 + 0.5)).round)
                    .and change { prices[:special_b2c].reload.price }.from(nil).to((1.33 * prices[:special_b2c].unit_gross).round)
  end

  context 'with new promo price' do
    let(:prices) do
      super().merge(
        promo: create(:price, :promo, product: product, price: nil)
      )
    end

    it 'recalculates prices properly with promo' do
      expect do
        described_class.new(product: product.reload).call
      end.to change { prices[:b2b].reload.price }.from(nil).to((1.1 * prices[:b2b].unit_net).round)
               .and change { prices[:b2c].reload.price }.from(nil).to((200 * (1 + 0.5)).round)
                      .and change { prices[:special_b2c].reload.price }.from(nil).to((1.33 * prices[:special_b2c].unit_gross).round)
                             .and change { prices[:promo].reload.price }.from(nil).to((0.5 * prices[:promo].unit_gross).round)
    end
  end
end
