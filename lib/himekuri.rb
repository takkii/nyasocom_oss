# typed: false
# frozen_string_literal: true

require 'date'
require 'time'

# HimekuriClass
class HimekuriClass
  def himekuri_print
    dt = Date.today
    week = %w[日 月 火 水 木 金 土][dt.wday]
    print '時刻を表示 : '
    t = Time.new # 今日の日付と時刻
    print t.getlocal('+09:00').strftime('%Y年%m月%d日 : %H時%M分%S秒 : ')
    puts week + '曜日'
  end

  def count_print
    t = Time.new
    x = Time.mktime(t.year, t.month, t.day)
    y = Time.mktime(t.year + 1, 1, 1)

    # 1 years 365 days.
    print '来年の1月1日まであと: '
    print (((y - x) / 60 / 60 / 24) - 1).round
    puts ' 日です'
  end

  def reiwa_print
    t = Time.new # 今日の日付と時刻
    td = Date.today

    nen = %w[令和]
    puts (nen[0] + "#{td.year - 2018}年" + "#{td.month}月" + "#{td.day}日") + ' : ' + t.to_date.jisx0301
  end

  def wahugetsu_print
    td = Date.today
    nen = %w[令和]
    wahugetsu = %w[睦月 如月 弥生 卯月 皐月 水無月 文月 葉月 長月 神無月 霜月 師走]
    wahugetsu_uru = %w[睦月 如月 弥生 卯月 皐月 水無月 文月 葉月 長月 神無月 霜月 師走]

    calc = if "#{td.year}".to_i % 4 == 0 && "#{td.year}".to_i % 100 != 0 || "#{td.year}".to_i % 400 == 0
             wahugetsu_uru[td.month - 1]
           else
             wahugetsu[td.month]
           end

    if "#{wahugetsu[td.month]}" == 13.to_s || "#{wahugetsu[td.month]}" == 0.to_s
      begin
        raise 'あり得ない数時の月です!'
      rescue StandardError => e
        puts e.cause.message
      end
    else
      puts(nen[0] + "#{td.year - 2018}年" + "#{td.month}月" + "#{td.day}日" + ' : ' + "#{calc}")
    end
  end

  def reiwa
    td = Date.today
    nen = %w[令和]
    week = %w[日 月 火 水 木 金 土][td.wday]
    (nen[0] + "#{td.year - 2018}年" + "#{td.month}月" + "#{td.day}日" + ' : ' + "#{week}" + '曜日')
  end

  def himekuri
    dt = Date.today
    week = %w[日 月 火 水 木 金 土][dt.wday]
    t = Time.new # 今日の日付と時刻
    t.getlocal('+09:00').strftime('%Y年%m月%d日 : %H時%M分%S秒 : ').to_s + week + '曜日'
  end

  def count
    t = Time.new
    x = Time.mktime(t.year, t.month, t.day)
    y = Time.mktime(t.year + 1, 1, 1)

    # 1 years 365 days.
    '来年の1月1日まであと: ' + (((y - x) / 60 / 60 / 24) - 1).round.to_s + ' 日です'
  end

  def wahugetsu_web
    td = Date.today
    nen = %w[令和]
    wahugetsu = %w[睦月 如月 弥生 卯月 皐月 水無月 文月 葉月 長月 神無月 霜月 師走]
    wahugetsu_uru = %w[睦月 如月 弥生 卯月 皐月 水無月 文月 葉月 長月 神無月 霜月 師走]

    calc = if "#{td.year}".to_i % 4 == 0 && "#{td.year}".to_i % 100 != 0 || "#{td.year}".to_i % 400 == 0
             wahugetsu_uru[td.month - 1]
           else
             wahugetsu[td.month]
           end

    if "#{wahugetsu[td.month]}" == 13.to_s || "#{wahugetsu[td.month]}" == 0.to_s
      begin
        raise 'あり得ない数時の月です!'
      rescue StandardError => e
        puts e.cause.message
      end
    else
      (nen[0] + "#{td.year - 2018}年" + "#{td.month}月" + "#{td.day}日" + ' : ' + "#{calc}")
    end
  end
end

__END__
