require 'muon-cli/connection'
require 'muon-cli/request'
require 'muon-cli/client_methods'

module Muon
  module CLI
    class Client
      Dir["#{File.dirname(__FILE__)}/client/*.rb"].each {|f| require f}
      include Muon::CLI::Connection
      include Muon::CLI::Request

      include Muon::CLI::Client::Endpoint
      include Muon::CLI::Client::Projects
      include Muon::CLI::Client::Tasks
      include Muon::CLI::Client::TimeEntries
    end
  end
end
