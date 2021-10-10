module Binance
  module SDK
    class Ticker
      class << self
        def price(symbol)
          timestamp = Configuration.timestamp

          params = { recvWindow: 5000, timestamp: timestamp, symbol: symbol }

          Request.send!(
            api_key_type: :read_info, path: Endpoints.fetch(:ticker_price),
            params: params.delete_if { |_, value| value.nil? },
            security_type: :user_data, api_key: Configuration.api_key, api_secret_key: Configuration.secret_key
          )
        end
      end
    end
  end
end
