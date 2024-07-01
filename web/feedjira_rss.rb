# frozen_string_literal: true

require 'feedjira'
require 'httparty'

begin
  url = 'http://github.com/takkii.atom'
  @rss = HTTParty.get(url).body
  
  Feedjira.parse(@rss).entries.each do |entry|
    File.open('nokogiri_rss.xml', 'a:utf-8', perm = 0o777) do |f|
        f.puts @rss
    end
 end

rescue StandardError => e
  puts e.backtrace
ensure
  GC.compact
end
