# frozen_string_literal: true

require 'rspec/core/rake_task'

require 'bundler/setup'
load 'tasks/otr-activerecord.rake'

namespace :db do
  task :environment do
    require_relative 'config/environment'
  end
end

namespace :grape do
  desc 'Print compiled grape routes'
  task :routes do
    require_relative 'config/environment'
    ATM::BaseAPI.routes.each do |api|
      method = api.request_method
      path = api.path
      puts "#{method}\t#{path}"
    end
  end
end

RSpec::Core::RakeTask.new

task default: :spec
task test: :spec
