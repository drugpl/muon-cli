module Muon
  module CLI
    class Client
      module Tasks
        extend Muon::CLI::ClientMethods
        resource :tasks
      end
    end
  end
end
