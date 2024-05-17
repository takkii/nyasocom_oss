# frozen_string_literal: true

require 'bundler'
Bundler.require

require './stand'

run Sinatra::Application
