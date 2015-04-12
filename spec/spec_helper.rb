$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
if ENV['CODECLIMATE_REPO_TOKEN']
  require 'codeclimate-test-reporter'
  CodeClimate::TestReporter.start
end
require 'quake_log_parser'
require 'pry'
require 'rspec/collection_matchers'
