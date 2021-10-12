module Binance
  module SDK
    class Endpoints
      class << self
        def fetch(identifier)
          Configuration.futures? ? future_endpoints[identifier] : spot_endpoints[identifier]
        end

        private

        def future_endpoints
          {
            server_time: '/fapi/v1/time',
            account_balance: '/fapi/v2/balance',
            account_position_risk: '/fapi/v2/positionRisk',
            exchange_info: '/fapi/v1/exchangeInfo',
            klines: '/fapi/v1/klines',
            put_order: '/fapi/v1/order',
            cancel_orders: '/fapi/v1/allOpenOrders',
            ticker_price: '/fapi/v1/ticker/price',
            change_leverage: '/fapi/v1/leverage'
          }
        end

        def spot_endpoints
          {
            server_time: '/sapi/v1/time',
            account_balance: '/sapi/v2/balance',
            account_position_risk: '/sapi/v2/positionRisk',
            exchange_info: '/sapi/v1/exchangeInfo',
            klines: '/sapi/v1/klines',
            put_order: '/sapi/v1/order',
            cancel_orders: '/sapi/v1/allOpenOrders',
            ticker_price: '/sapi/v1/ticker/price'
          }
        end
      end
    end
  end
end