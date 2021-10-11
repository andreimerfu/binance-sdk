# frozen_string_literal: true

RSpec.describe Binance::SDK do
  it "has a version number" do
    expect(Binance::SDK::VERSION).not_to be nil
  end
end
