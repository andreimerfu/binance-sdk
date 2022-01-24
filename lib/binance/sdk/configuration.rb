module Binance
  module SDK
    class Configuration
      class << self
        attr_writer :api_key, :locale, :read_info_api_key, :secret_key, :trading_api_key, :withdrawals_api_key, :futures, :testnet

        def api_key(type: nil)
          raise Error.new(message: "Invalid api_key type: #{type}.") unless type.nil? || API_KEY_TYPES.include?(type)

          instance_api_key(type: type)
        end

        def secret_key
          instance_variable_get("@secret_key") ||  ENV["BINANCE_SECRET_KEY"]
        end

        def futures?
          (instance_variable_get("@futures") || ENV["BINANCE_FUTURES"]) == true
        end

        def spot?
          !futures?
        end

        def testnet?
          (instance_variable_get("@testnet") || ENV["BINANCE_TESTNET"]) == true
        end

        def signed_request_signature(payload:, api_secret_key: nil)
          raise Error.new(message: "Environment variable 'BINANCE_SECRET_KEY' is required for signed requests.") unless api_secret_key || secret_key

          digest = OpenSSL::Digest::SHA256.new
          OpenSSL::HMAC.hexdigest(digest, api_secret_key || secret_key, payload)
        end

        def tld
          tld = ENV["BINANCE_TLD"]&.downcase&.to_sym || :com
          validate_tld!(tld)

          tld
        end

        def timestamp
          Time.now.strftime("%s%3N")
        end

        def validate_tld!(tld)
          error_message = "Invalid tld (top-level-domain): #{tld}. Use one of: #{ALLOWED_TLDS.join(", ")}."

          raise Error.new(message: error_message) unless ALLOWED_TLDS.include?(tld&.to_sym)
        end

        private

        API_KEY_TYPES = [:none, :read_info, :trading, :withdrawals].freeze
        ALLOWED_TLDS = [:com, :us].freeze

        def instance_api_key(type: nil)
          var = "#{type.to_s.downcase}_api_key".sub(/^\_/, "")

          instance_variable_get("@#{var}")
        end
      end
    end
  end
end