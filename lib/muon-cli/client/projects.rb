module Muon
  module CLI
    class Client
      module Projects
        extend Muon::CLI::ClientMethods
        resource :projects
      end
    end
  end
end
