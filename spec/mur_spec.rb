# frozen_string_literal: true

ENV['RACK_ENV'] = 'test'

require './stand'
require 'spec_helper'
require 'rspec'
require 'rack/test'

describe 'The Stand by me App' do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  describe "Stand by me Sinatra Application" do
    it "should allow accessing the home page" do
      get '/'
      expect(last_response).to be_ok
    end
    end
end

RSpec.configure do |conf|
  conf.include Rack::Test::Methods
end