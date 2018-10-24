# frozen_string_literal: true

require 'rubygems'
require 'bundler/setup'

Bundler.require :default, ENV['RACK_ENV']

OTR::ActiveRecord.configure_from_file! 'config/database.yml'

Dir[File.expand_path('../app/helpers/*.rb', __dir__)].each do |f|
  require f
end

Dir[File.expand_path('../app/models/*.rb', __dir__)].each do |f|
  require f
end

Dir[File.expand_path('../app/api/*.rb', __dir__)].each do |f|
  require f
end

require File.expand_path('../app/atm_base_api', __dir__)
