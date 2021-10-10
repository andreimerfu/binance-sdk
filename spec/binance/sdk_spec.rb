# frozen_string_literal: true

RSpec.describe Binance::Sdk do
  it "has a version number" do
    expect(Binance::Sdk::VERSION).not_to be nil
  end
end
