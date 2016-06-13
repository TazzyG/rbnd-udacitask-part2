class EventItem
  include Listable
  attr_accessor :start_date, :end_date

  def initialize(description, options={})
    @description = description
    @start_date = Chronic.parse(options[:start_date]) if options[:start_date]
    @end_date = Chronic.parse(options[:end_date]) if options[:end_date]
    if @start_date && @end_date && (@start_date > @end_date)
      raise UdaciListErrors::EventPeriodError, "#{@end_date} is should be after #{@start_date}"
    end
    @type = "event"
  end
  
  def move_dates(number_of_days)
    
    @number_days = number_of_days
    
    @start_date = @start_date.to_date + number_of_days if @start_date 
    @end_date = @start_date.to_date + number_of_days if @end_date
   
    if @start_date.to_date < DateTime.now
      raise UdaciListErrors::InvalidSchedule, "Start date must be in the future"
    end
  end

  def details
    format_description(@description) + "event dates: " + format_date(@start_date, @end_date)
  end
end
