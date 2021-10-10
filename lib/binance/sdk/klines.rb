module Binance
  module SDK
    class Klines
      class << self
        def data(symbol, interval = '5m', start_time = nil, end_time = nil, limit = nil, recvWindow: 5000)
          timestamp = Configuration.timestamp

          params = {
            recvWindow: recvWindow,
            timestamp: timestamp,
            symbol: symbol,
            interval: interval,
            start_time: start_time,
            end_time: end_time,
            limit: limit
          }

          Request.send!(
            api_key_type: :read_info, path: Endpoints.fetch(:klines),
            params: params.delete_if { |key, value| value.nil? },
            security_type: :user_data, api_key: Configuration.api_key, api_secret_key: Configuration.secret_key
          )
        end
      end
    end
  end
end