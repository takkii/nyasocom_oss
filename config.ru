require 'bundler'
Bundler.require

require "#{File.dirname(__FILE__)}/stand"

run Sinatra::Application
