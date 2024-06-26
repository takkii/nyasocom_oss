# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'date'
require 'himekuri'
require 'nokogiri'
require 'sinatra'
require 'sinatra/reloader'
require 'version'
require 'zella'

# class katana is mumei and slogan
class Katana
  attr_accessor :mumei, :slogan

  def initialize(mumei, slogan)
    @mumei = mumei
    @slogan = slogan
  end
end


get '/' do

File.open("#{File.dirname(__FILE__)}/web/rss.xml") do |f|
  xml = f.read
  @rss = Nokogiri::XML(xml, nil, "UTF-8")
end

  @title = @rss.css('title')
  published = @rss.css('published').first.content
  @pub_date = Date.parse(published).strftime '投稿日 ： %Y年%m月%d日'
  @rss_kan = '[ 最近の投稿日を表示 ]'
  @kanban = '[ これより、30タイトル程ずつ履歴表示します ]'
  @ruby = ('Ruby_VERSION : ' + RUBY_VERSION + ' ' + 'Sinatra_VERSION : ' + Sinatra::VERSION)
  @himekuri = HimekuriClass.new.himekuri
  @reiwa = HimekuriClass.new.reiwa
  @year = DateTime.now.year
  @wahugetsu = HimekuriClass.new.wahugetsu_web
  @zella = Zella.formula
  @takkii = ' Takayuki Kamiyama All Rights Reserved. '
  @saya = Katana.new('Designed by NyaSoCom', 'Not Yet Another Software design of Computer')
  @nyasocom_version = NYASOCOM::VERSION
  erb :index
end
