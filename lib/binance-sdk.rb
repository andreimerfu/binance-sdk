# frozen_string_literal: true
require 'pry'
require 'active_support/core_ext/string'
require 'awrence'
require 'httparty'
require 'faye/websocket'
require 'dry/inflector'

Dry::Inflector.new do |inflections|
  inflections.acronym 'SDK'
end

require_relative 'binance/sdk/version'
require_relative 'binance/sdk/error'
require_relative 'binance/sdk/configuration'
require_relative 'binance/sdk/request'
require_relative 'binance/sdk/endpoints'
require_relative 'binance/sdk/account'
require_relative 'binance/sdk/klines'
require_relative 'binance/sdk/ticker'
require_relative 'binance/sdk/exchange'
require_relative 'binance/sdk/orders'
require_relative 'binance/sdk/websocket'
require_relative 'binance/sdk/asset'
