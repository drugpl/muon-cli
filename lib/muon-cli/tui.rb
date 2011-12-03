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
          File.open(".muon/history", "a") do |f|
            f.write(%Q{#{options[:time]}, #{options[:project]}, #{options[:m]}\n})
          end
        end
      end

      desc 'Send data to api server'
      command :commit do |c|
        c.action do |global, options, arguments|
          # send api stuff
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
          puts options.inspect
        end
      end
    end
  end
end
