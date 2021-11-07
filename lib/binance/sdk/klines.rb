module Binance
  module SDK
    class Klines
      class << self
        # [
        #   [
        #     1499040000000,      // Open time
        #     "0.01634790",       // Open
        #     "0.80000000",       // High
        #     "0.01575800",       // Low
        #     "0.01577100",       // Close
        #     "148976.11427815",  // Volume
        #     1499644799999,      // Close time
        #     "2434.19055334",    // Quote asset volume
        #     308,                // Number of trades
        #     "1756.87402397",    // Taker buy base asset volume
        #     "28.46694368",      // Taker buy quote asset volume
        #     "17928899.62484339" // Ignore.
        #   ]
        # ]
        def data(symbol, interval = '5m', start_time = nil, end_time = nil, limit = nil, recvWindow: 5000)
          timestamp = Configuration.timestamp

          params = {
            recvWindow: recvWindow,
            timestamp: timestamp,
            symbol: symbol,
            interval: interval,
            startTime: start_time,
            endTime: end_time,
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