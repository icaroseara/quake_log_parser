$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'quake_log_parser'
require 'pry'
require 'rspec/collection_matchers'
require "codeclimate-test-reporter"
CodeClimate::TestReporter.start