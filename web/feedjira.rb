# frozen_string_literal: true

require 'feedjira'
require 'httparty'

begin
  url = 'http://github.com/takkii.atom'
  @rss = HTTParty.get(url).body

  File.open('rss.xml', 'a:utf-8', perm = 0o777) do |f|
    f.puts @rss
  end
rescue StandardError => e
  puts e.backtrace
ensure
  GC.compact
end
