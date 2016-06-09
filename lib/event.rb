class EventItem
  include Listable
  attr_reader :start_date, :end_date

  def initialize(description, options={})
    @description = description
    @start_date = Chronic.parse(options[:start_date]) if options[:start_date]
    @end_date = Chronic.parse(options[:end_date]) if options[:end_date]
    if @start_date && @end_date && (@start_date > @end_date)
      raise UdaciListErrors::EventPeriodError, "#{@end_date} is should be after #{@start_date}"
    end
    @type = "event"
  end
  
  def format_duration_date(start_date, end_date)
    dates = @start_date.strftime("%D") if @start_date
    dates << " -- " + @end_date.strftime("%D") if @end_date
    dates = "N/A" unless dates
    return dates
  end

  def details
    format_description(@description) + "event dates: " + format_duration_date(@start_date, @end_date)
  end
end
