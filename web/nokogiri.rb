# frozen_string_literal: true

require 'nokogiri'

begin
  File.open("#{File.dirname(__FILE__)}/rss.xml") do |f|
    xml = f.read
    @rss = Nokogiri::XML(xml, nil, "UTF-8")
    title = @rss.css('title')
    title.each do |link|
        puts link.text
        puts ''
    end
  end

rescue StandardError => e
  puts e.backtrace
ensure
  GC.compact
end
