module Muon
  module CLI
    class Client
      # client class namespaces modules
      require 'muon-cli/client/projects'
      require 'muon-cli/client/tasks'
      require 'muon-cli/client/time_entries'

      include Muon::CLI::Client::Project
      include Muon::CLI::Client::Tasks
      include Muon::CLI::Client::TimeEntries
    end
  end
end
