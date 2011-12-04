require 'gli'
include GLI

module Muon
  module CLI
    module TUI

      def history_file
        File.join(ENV["HOME"], ".muon/history")
      end

      program_desc 'muon allow you to writing down your work time'

      desc 'API key'
      arg_name 'api-key'
      flag [:a, :api, :'api-key']

      desc 'Add work time'
      command :add do |c|
        c.desc 'Taks message'
        c.flag :m

        c.desc 'How much time do you spend on a task'
        c.flag [:t, :time, :amount]

        c.desc 'When task was done'
        c.default_value Time.now.to_s
        c.flag :date

        c.desc 'Project name'
        c.flag [:p, :project]

        c.action do |global, options, arguments|
          raise "No requred arguments" unless options[:time] && options[:project] && options[:m]
          begin
            File.open(history_file, "a") do |f|
              puts f.write(%Q{"#{options[:time]}","#{options[:project]}","#{options[:m]}"\n})
            end
          rescue Errno::ENOENT
            Dir.mkdir(File.join(ENV["HOME"], ".muon"))
            redo
          end
        end
      end

      desc 'Send data to api server'
      command :commit do |c|
        c.action do |global, options, arguments|
          client = Muon::CLI::Client.new

          begin
            File.open(history_file) do |f|
              f.each_line do |line|
                entry = line.chop.split(",").map!{|e| e[1...-1]}
                puts "Commited: #{entry}"
                @amount = ChronicDuration.parse(entry[0])
                @unit = "sec"
                @project = entry[1]
                @desc = entry[2]
                @date = entry[3] || Time.now
                client.create_time_entries(:unit => @unit, :amount => @amount, :description => @desc, :reported_at => @date)
              end
            end
            File.delete(history_file)
          rescue Errno::ENOENT
            puts "Nothing to commit"
          end
        end
      end

      desc 'List project details'
      command :list do |c|
        c.desc 'List my time entries'
        c.switch :time

        c.desc 'List my tasks'
        c.switch :task

        c.desc 'List my projects'
        c.switch :project

        c.action do |global, options, arguments|
          client = Muon::CLI::Client.new
          client.time_entries.each do |time|
            puts %Q{Time: #{(time['amount'].to_f / (60.0**2)).round(2)} h | ID: #{time['id']}}
          end
        end
      end
    end
  end
end
