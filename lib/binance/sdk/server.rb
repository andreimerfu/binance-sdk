module Binance
  module SDK
    class Server
      class << self
        def time
          Request.send!(
            api_key_type: :read_info, path: Endpoints.fetch(:server_time),
            params: {},
            security_type: :user_data, api_key: Configuration.api_key, api_secret_key: Configuration.secret_key
          )
        end
      end
    end
  end
end