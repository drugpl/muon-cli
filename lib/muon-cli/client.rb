require 'muon-cli/connection'
require 'muon-cli/request'
require 'muon-cli/client_methods'

module Muon
  module CLI
    class Client
      # client class namespaces modules
      require 'muon-cli/client/projects'
      require 'muon-cli/client/tasks'
      require 'muon-cli/client/time_entries'
      require 'muon-cli/client/endpoint'

      include Muon::CLI::Connection
      include Muon::CLI::Request

      include Muon::CLI::Client::Endpoint
      include Muon::CLI::Client::Projects
      include Muon::CLI::Client::Tasks
      include Muon::CLI::Client::TimeEntries
    end
  end
end
