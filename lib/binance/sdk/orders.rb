module Binance
  module SDK
    class Orders
      class << self
        def put_order!(symbol:, type: 'TRAILING_STOP_MARKET', side: 'BUY', callback_rate: 4, quantity: 1.0, working_type: nil, position_side: 'BOTH')
          params = {
            recvWindow: 60000,
            timestamp: Configuration.timestamp.to_i - 1000,
            symbol: symbol,
            side: side,
            type: type,
            quantity: quantity,
            callbackRate: callback_rate,
            workingType: working_type,
            positionSide: position_side,
          }

          Request.send!(
            method: :post,
            api_key_type: :read_info, path: Endpoints.fetch(:put_order),
            params: params.delete_if { |_, value| value.nil? },
            security_type: :user_data, api_key: Configuration.api_key, api_secret_key: Configuration.secret_key
          )
        end

        def close_position!(symbol:, side:, quantity:)
          params = {
            recvWindow: 60000,
            timestamp: Configuration.timestamp.to_i - 1000,
            symbol: symbol,
            side: side,
            type: 'MARKET',
            quantity: quantity,
            positionSide: side,
          }

          Request.send!(
            method: :post,
            api_key_type: :read_info, path: Endpoints.fetch(:put_order),
            params: params.delete_if { |_, value| value.nil? },
            security_type: :user_data, api_key: Configuration.api_key, api_secret_key: Configuration.secret_key
          )
        end

        def stop_loss(symbol:, side:, stop_price:)
          params = {
            recvWindow: 60000,
            timestamp: Configuration.timestamp.to_i - 1000,
            symbol: symbol,
            type: 'STOP',
            side: side,
            stopPrice: stop_price
          }

          Request.send!(
            method: :post,
            api_key_type: :read_info, path: Endpoints.fetch(:put_order),
            params: params.delete_if { |_, value| value.nil? },
            security_type: :user_data, api_key: Configuration.api_key, api_secret_key: Configuration.secret_key
          )
        end

        def cancel_order!(symbol:)
          params = {
            recvWindow: 60000,
            timestamp: Configuration.timestamp.to_i - 1000,
            symbol: symbol,
            type: 'MARKET'
          }

          Request.send!(
            method: :delete,
            api_key_type: :read_info, path: Endpoints.fetch(:put_order),
            params: params.delete_if { |_, value| value.nil? },
            security_type: :user_data, api_key: Configuration.api_key, api_secret_key: Configuration.secret_key
          )
        end

        def cancel_orders!(symbol:)
          params = {
            recvWindow: 60000,
            timestamp: Configuration.timestamp.to_i - 1000,
            symbol: symbol
          }

          Request.send!(
            method: :delete,
            api_key_type: :read_info, path: Endpoints.fetch(:cancel_orders),
            params: params.delete_if { |_, value| value.nil? },
            security_type: :user_data, api_key: Configuration.api_key, api_secret_key: Configuration.secret_key
          )
        end

        def change_leverage(symbol:, leverage:)
          params = {
            symbol: symbol,
            leverage: leverage.to_i,
            timestamp: Configuration.timestamp
          }

          Request.send!(
            method: :post,
            api_key_type: :read_info, path: Endpoints.fetch(:change_leverage),
            params: params,
            security_type: :user_data, api_key: Configuration.api_key, api_secret_key: Configuration.secret_key
          )
        end
      end
    end
  end
end