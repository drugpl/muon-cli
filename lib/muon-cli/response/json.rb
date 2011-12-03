require 'json'

module Muon
  module CLI
    module Response
      class ParseJson < Faraday::Response::Middleware
        def parse(body)
          case body
            when ''
              nil
            when 'true'
              true
            when 'false'
              false
            else
              JSON.parse(body)
          end
        end
      end
    end
  end
end
