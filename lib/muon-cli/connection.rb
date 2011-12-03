module Muon
  module CLI
    module Connection
      private

      def connection(options = {})
        default_options = {
          :headers => {
            :accept => 'application/json'
          }
        }

        Faraday.new(default_options.merge(options)) do |builder|
          builder.use Muon::CLI::Response::ParseJson # auto parse json
          builder.use Faraday::Adapter::NetHttp # use net-http
        end
      end
    end
  end
end
