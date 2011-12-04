module Muon
  module CLI
    class Client
      module TimeEntries
        extend Muon::CLI::ClientMethods
        resource :time_entries
      end
    end
  end
end
