# typed: false
# frozen_string_literal: true

ENV['RACK_ENV'] = 'test'

require './stand'
require 'himekuri'
require 'rspec'
require 'rack/test'
require 'spec_helper'
require 'time'
require 'zella'

describe 'The Stand by me App' do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def himekuri
    dt = Date.today
    week = %w[日 月 火 水 木 金 土][dt.wday]
    t = Time.new # 今日の日付と時刻
    t.getlocal('+09:00').strftime('%Y年%m月%d日 : %H時%M分%S秒 : ').to_s + week + '曜日'
  end

  def zella
    td = Date.today
    year = td.year.to_i
    month = td.month.to_i
    day = td.day.to_i

    calc = if year % 4 == 0 && year % 100 != 0 || year % 400 == 0
             if "#{month}".match?(/^2$/)
               ((365 * year + year / 4 - year / 100 + year / 400 + (306 * (month + 1)) / 10 + day) - 426) % 7
             elsif "#{month}".match?(/^11$/)
               ((365 * year + year / 4 - year / 100 + year / 400 + (306 * (month + 1)) / 10 + day) - 427) % 7
             else
               ((365 * year + year / 4 - year / 100 + year / 400 + (306 * (month + 1)) / 10 + day) - 428) % 7
             end
           else
             (year + year / 4 - year / 100 + year / 400 + (13 * month + 8) / 5 + day) % 7
           end

    week = %w[日 月 火 水 木 金 土][calc]

    "#{year}年#{month}月#{day}日 : #{week}曜日"
  end

  describe 'Stand by me Sinatra Application' do
    it 'should allow accessing the home page' do
      get '/'
      expect(last_response).to be_ok
    end
  end

  describe 'Himekuri code compared to actual code' do
    it 'what day is it today?' do
      expect(HimekuriClass.new.himekuri).to eq(himekuri)
    end
  end

  describe 'Zella code compared to actual code' do
    it 'what day is it today?' do
      expect(Zella.formula).to eq(zella)
    end
  end
end

RSpec.configure do |conf|
  conf.include Rack::Test::Methods
end
