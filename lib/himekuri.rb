# frozen_string_literal: true

require 'date'
require 'time'

# use himekuri-0.1.8.gem in ./lib/himakuri.rb
class HimekuriClass

  def himekuri_print
    dt = Date.today
    week = %w(日 月 火 水 木 金 土)[dt.wday];
    print '時刻を表示 : '
    t = Time.new # 今日の日付と時刻
    print t.strftime('%Y年%m月%d日 : %H時%M分%S秒 : ')
    puts week + "曜日"
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
    puts (nen[0] + "#{(td.year - 2018)}年" + "#{td.month}月" + "#{td.day}日") + ' : ' + t.to_date.jisx0301
  end

  def wahugetsu_print
    td = Date.today
    nen = %w[令和]

    if td.month == 1
      puts (nen[0] + "#{(td.year - 2018)}年"+"#{td.month}月"+" : "+"睦月")
    elsif td.month == 2
      puts (nen[0] + "#{(td.year - 2018)}年"+"#{td.month}月"+" : "+"如月")
    elsif td.month == 3
      puts (nen[0] + "#{(td.year - 2018)}年"+"#{td.month}月"+" : "+"弥生")
    elsif td.month == 4
      puts (nen[0] + "#{(td.year - 2018)}年"+"#{td.month}月"+" : "+"卯月")
    elsif td.month == 5
      puts (nen[0] + "#{(td.year - 2018)}年"+"#{td.month}月"+" : "+"皐月")
    elsif td.month == 6
      puts (nen[0] + "#{(td.year - 2018)}年"+"#{td.month}月"+" : "+"水無月")
    elsif td.month == 7
      puts (nen[0] + "#{(td.year - 2018)}年"+"#{td.month}月"+" : "+"文月")
    elsif td.month == 8
      puts (nen[0] + "#{(td.year - 2018)}年"+"#{td.month}月"+" : "+"葉月")
    elsif td.month == 9
      puts (nen[0] + "#{(td.year - 2018)}年"+"#{td.month}月"+" : "+"長月")
    elsif td.month == 10
      puts (nen[0] + "#{(td.year - 2018)}年"+"#{td.month}月"+" : "+"神無月")
    elsif td.month == 11
      puts (nen[0] + "#{(td.year - 2018)}年"+"#{td.month}月"+" : "+"霜月")
    elsif td.month == 12
      puts (nen[0] + "#{(td.year - 2018)}年"+"#{td.month}月"+" : "+"師走")
    else
      begin
        raise "あり得ない数時の月です!"
      rescue => e
        puts e.cause.message
      end
    end
  end

  def reiwa
    td = Date.today
    nen = %w(令和)
    (nen[0] + "#{(td.year - 2018)}年"+"#{td.month}月"+"#{td.day}日"+ %w(日 月 火 水 木 金 土)[td.wday] + "曜日" )
  end

  def himekuri
    dt = Date.today
    week = %w(日 月 火 水 木 金 土)[dt.wday]
    t = Time.new # 今日の日付と時刻
    t.strftime('%Y年%m月%d日 : %H時%M分%S秒 : ').to_s + week + "曜日"
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

    if td.month == 1
      (nen[0] + "#{(td.year - 2018)}年"+"#{td.month}月"+" : "+"睦月")
    elsif td.month == 2
      (nen[0] + "#{(td.year - 2018)}年"+"#{td.month}月"+" : "+"如月")
    elsif td.month == 3
      (nen[0] + "#{(td.year - 2018)}年"+"#{td.month}月"+" : "+"弥生")
    elsif td.month == 4
      (nen[0] + "#{(td.year - 2018)}年"+"#{td.month}月"+" : "+"卯月")
    elsif td.month == 5
      (nen[0] + "#{(td.year - 2018)}年"+"#{td.month}月"+" : "+"皐月")
    elsif td.month == 6
      (nen[0] + "#{(td.year - 2018)}年"+"#{td.month}月"+" : "+"水無月")
    elsif td.month == 7
      (nen[0] + "#{(td.year - 2018)}年"+"#{td.month}月"+" : "+"文月")
    elsif td.month == 8
      (nen[0] + "#{(td.year - 2018)}年"+"#{td.month}月"+" : "+"葉月")
    elsif td.month == 9
      (nen[0] + "#{(td.year - 2018)}年"+"#{td.month}月"+" : "+"長月")
    elsif td.month == 10
      (nen[0] + "#{(td.year - 2018)}年"+"#{td.month}月"+" : "+"神無月")
    elsif td.month == 11
      (nen[0] + "#{(td.year - 2018)}年"+"#{td.month}月"+" : "+"霜月")
    elsif td.month == 12
      (nen[0] + "#{(td.year - 2018)}年"+"#{td.month}月"+" : "+"師走")
    else
      begin
        raise "あり得ない数時の月です!"
      rescue => e
        e.cause.message
      end
    end
  end
end

__END__
