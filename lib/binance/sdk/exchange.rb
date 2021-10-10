module Binance
  module SDK
    class Exchange
      class << self
        def info!
          timestamp = Configuration.timestamp

          params = { recvWindow: 5000, timestamp: timestamp }

          Request.send!(
            api_key_type: :read_info, path: Endpoints.fetch(:exchange_info),
            params: params.delete_if { |key, value| value.nil? },
            security_type: :user_data, api_key: Configuration.api_key, api_secret_key: Configuration.secret_key
          )
        end
      end
    end
  end
end