# frozen_string_literal: true

require 'sinatra'
require 'feedjira'
require 'date'
require 'sinatra/reloader'
require 'httparty'
require "#{File.dirname(__FILE__)}/lib/himekuri"

# class katana is mumei and slogan
class Katana
  attr_accessor :mumei, :slogan

  def initialize(mumei, slogan)
    @mumei = mumei
    @slogan = slogan
  end
end

get '/' do
  @kanban = '[これより、30タイトル程ずつ履歴表示します]'
  url = 'http://github.com/takkii.atom'
  @rss = HTTParty.get(url).body
  # Feedjira 2.2.0
  # @rss = Feedjira::Feed.fetch_and_parse('http://github.com/takkii.atom')
  @ruby = ('Ruby_VERSION : ' + RUBY_VERSION + ' ' + 'Sinatra_VERSION : ' + Sinatra::VERSION)
  @himekuri = HimekuriClass.new.himekuri
  @reiwa = HimekuriClass.new.reiwa
  @year = DateTime.now.year
  @wahugetsu = HimekuriClass.new.wahugetsu_web
  @takkii = ' Takayuki Kamiyama All Rights Reserved. '
  @saya = Katana.new('Designed by NyaSoCom', 'Not Yet Another Software design of Computer')
  @nyasocom_version = '1.0'
  erb :index
end
