module Binance
  module SDK
    class Asset
      class << self
        def change_margin_type(symbol:, type: 'ISOLATED')
           params = {
              recvWindow: 60000,
              timestamp: Configuration.timestamp.to_i - 1000,
              symbol: symbol,
              marginType: type
           }

           Request.send!(
            method: :post,
            api_key_type: :read_info, path: Endpoints.fetch(:margin_type),
            params: params.delete_if { |_, value| value.nil? },
            security_type: :user_data, api_key: Configuration.api_key, api_secret_key: Configuration.secret_key
          )
        rescue Binance::SDK::Error::NoNeedToChangeMarginType
        end
      end
    end
  end
end