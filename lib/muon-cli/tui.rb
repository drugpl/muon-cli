require 'muon-cli/tui/parser'
require 'gli'
include GLI

module Muon
  module CLI
    module TUI


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
          add_entry(options)
        end
      end

      desc 'Send data to api server'
      command :commit do |c|
        c.action do |global, options, arguments|
          @client = Muon::CLI::Client.new
          commit
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
