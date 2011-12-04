require 'faraday'
require 'faraday/response/parse_json'

module Muon
  module CLI
    module Connection
      private

      def connection(options = {})
        default_options = {
          :headers => {
            :accept => 'application/json'
          },
          :url => options.fetch(:endpoint, endpoint)
        }

        Faraday.new(default_options.merge(options)) do |builder|
          builder.use Faraday::Response::ParseJson
          builder.use Faraday::Adapter::NetHttp # use net-http
        end
      end
    end
  end
end
