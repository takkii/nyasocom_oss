# typed: true
# frozen_string_literal: true

require 'date'

# zella formula Instance.
class Zella
  # use Web.
  def self.formula
    # Today
    td = Date.today

    # use Import.
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

    # Result.
    begin
      "#{year}年#{month}月#{day}日 : #{week}曜日"
    rescue StandardError => e
      e.backtrace
    ensure
      GC.compact
    end
  end
end
