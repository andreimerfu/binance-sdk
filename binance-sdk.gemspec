# frozen_string_literal: true

lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "binance/sdk/version"

Gem::Specification.new do |spec|
  spec.name          = "binance-sdk"
  spec.version       = Binance::SDK::VERSION
  spec.authors       = ["Andrei Merfu"]
  spec.email         = ["andrei@amgital.com"]

  spec.summary       = "Binance SDK Ruby"
  spec.description   = "Binance SDK Ruby"
  spec.homepage      = "https://amgital.com"
  spec.license       = "MIT"
  spec.required_ruby_version = ">= 2.4.0"

  spec.metadata["allowed_push_host"] = "TODO: Set to your gem server 'https://example.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/amgital"
  spec.metadata["changelog_uri"] = "https://amgital.com"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  # spec.files = Dir.chdir(File.expand_path(__dir__)) do
  #   `git ls-files -z`.split("\x0").reject do |f|
  #     (f == __FILE__) || f.match(%r{\A(?:(?:test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
  #   end
  # end
  spec.files         = Dir['lib/**/*.rb']
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'rspec'

  # Uncomment to register a new dependency of your gem
  spec.add_dependency 'awrence'
  spec.add_dependency 'httparty'
  spec.add_dependency 'faye-websocket'
  spec.add_dependency 'eventmachine'
  spec.add_dependency 'dry-inflector'

  spec.add_runtime_dependency 'activesupport'
  # For more information and examples about making a new gem, checkout our
  # guide at: https://bundler.io/guides/creating_gem.html
end
