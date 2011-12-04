module Muon
  module CLI
    module ClientMethods
      def resource(name) # name time_entries
        define_method(name.to_sym) do |*args|
          if args.size == 0
            get("/#{name}")
          else
            get("#{name}/#{args.first}")
          end
        end

        define_method("create_#{name}") do |params|
          post("/#{name}", params)
        end

        define_method("update_#{name}") do |id, params|
          put("/#{name}/#{id}", params)
        end

        define_method("delete_#{name}") do |id|
          delete("/#{name}/#{id}")
        end
      end
    end
  end
end
