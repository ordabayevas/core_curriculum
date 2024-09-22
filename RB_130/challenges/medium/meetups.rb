# frozen_string_literal: true

require 'date'

class Meetup
  attr_reader :month, :year, :cur_month_length

  ORDERS = { 'first' => 1,
             'second' => 2,
             'third' => 3,
             'fourth' => 4,
             'fifth' => 5 }.freeze
  WEEKDAYS = { 'monday' => 1,
               'tuesday' => 2,
               'wednesday' => 3,
               'thursday' => 4,
               'friday' => 5,
               'saturday' => 6,
               'sunday' => 0 }.freeze

  def initialize(year, month)
    @month = month
    @year = year
    @cur_month_length = month_length
  end

  def month_length
    Date.new(year, month, -1).mday
  end

  def day(weekday, order)
    @weekday = weekday.downcase
    @order = order.downcase

    if @order == 'last'
      day_date = determine_last_day(@weekday)
    elsif @order == 'teenth'
      day_date determine_teenth_day(@weekday)
    else
      day_date = determine_date(@weekday)
    end

    day_date.nil? ? nil : Date.new(year, month, day_date)
  end

  def determine_date
    order_num = ORDERS[@order]
    weekday_num = WEEKDAYS[@weekday]

    order_counter = 0
    day_date = nil
    1.upto(cur_month_length) do |day|
      if Date.new(year, month, day).wday == weekday_num
        order_counter += 1
        break day_date = day if order_counter == order_num
      end
    end

    day_date
  end

  def determine_last_day
    last_day_date = nil
    weekday_num = WEEKDAYS[@weekday]

    (cur_month_length - 7).upto(cur_month_length) do |day|
      if Date.new(year, month, day).wday == weekday_num
        last_day_date = day
      end
    end

    last_day_date.nil? ? nil : Date.new(year, month, last_day_date)
  end

  def determine_teenth_day
    teenth_day_date = nil
    weekday_num = WEEKDAYS[@weekday]

    13.upto(19) do |day|
      if Date.new(year,month, day).wday == weekday_num
        teenth_day_date = day
      end
    end

    teenth_day_date.nil? ? nil : Date.new(year, month, teenth_day_date)
  end
end

p Meetup.new(2015, 10).day('Wednesday', 'first')
