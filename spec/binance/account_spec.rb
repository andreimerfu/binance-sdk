# frozen_string_literal: true

RSpec.describe Binance::Sdk::Account do
  subject(:account) { Binance::Sdk::Account.new('h9KmJDBxyhoyn5e5Dw1ZBuT2ZJS2wXwoqi0CIFSZwAUFgEDymusgeCpcJ0weHp1z', '4FkqBJAgY06f1gICU68TnWGcpPtrty8DMHyw1lea6nFSgetRx2jvqpMoRjlgnmKt') }

  it "get Account info" do
    expect(subject.info![:data]).to eq "Normal"
  end
end