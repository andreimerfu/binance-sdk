module Binance
  module SDK
    class Account
      class << self
        def info!(recvWindow: 5000)
          timestamp = Configuration.timestamp

          params = { recvWindow: recvWindow, timestamp: timestamp }

          response = Request.send!(
            api_key_type: :read_info, path: "/sapi/v1/account/status",
            params: params.delete_if { |key, value| value.nil? },
            security_type: :user_data, api_key: Configuration.api_key, api_secret_key: Configuration.secret_key
          )

          puts response
        end

        def balance!(recvWindow: 5000, currency: 'USDT')
          timestamp = Configuration.timestamp

          params = { recvWindow: recvWindow, timestamp: timestamp }

          balance = Request.send!(
            api_key_type: :read_info, path: Endpoints.fetch(:account_balance),
            params: params.delete_if { |key, value| value.nil? },
            security_type: :user_data, api_key: Configuration.api_key, api_secret_key: Configuration.secret_key
          )

          if futures?
            balance.find { |i| i[:asset] == currency }[:balance].to_f
          else
            balance[:balances].find { |i| i[:asset] == currency }[:free]
          end
        end

        def positions
          params = {
            recvWindow: 60000,
            timestamp: Configuration.timestamp
          }

          Request.send!(
            api_key_type: :read_info, path: Endpoints.fetch(:account_position_risk),
            params: params.delete_if { |key, value| value.nil? },
            security_type: :user_data, api_key: Configuration.api_key, api_secret_key: Configuration.secret_key
          )
        end

        private

        def futures?
          Configuration.futures?
        end
      end
    end
  end
end