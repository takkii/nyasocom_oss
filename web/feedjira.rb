# frozen_string_literal: true

require 'feedjira'
require 'httparty'

begin
  url = 'http://github.com/takkii.atom'
  @rss = HTTParty.get(url).body

  Feedjira.parse(@rss).entries.each do |entry|
    File.open('rss.xml', 'a:utf-8', perm = 0o777) do |f|
      # f.puts entry.url
      f.puts entry.summary
      f.puts entry.title
      f.puts ''
      f.puts entry.published.to_time.strftime '投稿時刻 ： %Y年%m月%d日 %H時%M分'
    end
 end

rescue StandardError => e
  puts e.backtrace
ensure
  GC.compact
end
