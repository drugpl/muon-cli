module Muon
  module CLI
    module TUI
      def history_file
        File.join(ENV["HOME"], ".muon/history")
      end

      def resovle_params(entry)
        {
          :amount       => ChronicDuration.parse(entry[0]),
          :unit         => :sec,
          :project      => entry[1],
          :description  => entry[2],
          :reported_at  => entry[3] || Time.now
        }
      end

      def commit
        begin
          File.open(history_file) do |f|
            f.each_line do |line|
              entry = line.chop.split(",").map!{|e| e[1...-1]}
              @client.create_time_entries(resovle_params(entry))
            end
          end
          File.delete(history_file)
        rescue Errno::ENOENT
          puts "Nothing to commit"
        end
      end

      def add_entry(options)
        check_requirments(options)
        begin
          File.open(history_file, "a") do |f|
            puts f.write(%Q{"#{options[:time]}","#{options[:project]}","#{options[:m]}"\n})
          end
        rescue Errno::ENOENT
          Dir.mkdir(File.join(ENV["HOME"], ".muon"))
          retry
        end
      end

      def check_requirments(options)
        raise "No required arguments" unless options[:time] && options[:project] && options[:m]
      end
    end
  end
end
