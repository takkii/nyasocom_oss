# typed: strict
# frozen_string_literal: true

require 'feedjira'
require 'fileutils'
require 'httparty'
require 'readline'
require 'time'

class Filefeed
  def self.delete
    puts ''
    puts 'Enter yes/no to delete rss.xml, tab completion is available.'
    puts ''

    sel = %w[yes no].map!(&:freeze).freeze

    Readline.completion_proc = proc {|word|
      sel.grep(/\A#{Regexp.quote word}/)
    }

    while (line = Readline.readline(""))
      line.chomp!

      if line.match?(sel[0])
        FileUtils.rm_rf("#{File.dirname(__FILE__)}/rss.xml")
        puts ''
        puts 'Deleted, the existing rss.xml file.'
        puts ''
        break
      elsif line.match?(sel[1])
        puts ''
        puts 'You selected No, No action will be taken.'
        puts ''
        break
      else
        puts ''
        puts 'Please enter yes or no as an argument.'
        puts ''
        break
      end
    end
  end

  def self.jira
    url = 'http://github.com/takkii.atom'
    @rss = HTTParty.get(url).body

    if File.exist?("#{File.dirname(__FILE__)}/rss.xml")
      puts ''
      puts 'rss.xml already exists.'
      delete
    else
      Feedjira.parse(@rss).entries.each do |entry|
        File.open('rss.xml', 'a:utf-8', perm = 0o777) do |f|
          f.puts "#{entry.summary} <a href='#{entry.url}'>#{entry.title}</a>"
          f.puts ''
          f.puts entry.published.to_time.getlocal('+09:00').strftime '投稿時刻 ： %Y年%m月%d日 %H時%M分'
          f.puts ''
        end
      end
      puts ''
      puts 'rss.xml has been created.' 
      puts ''  
    end
  end
end

begin
  Filefeed.jira
rescue StandardError => e
  puts e.backtrace
ensure
  GC.compact
end
