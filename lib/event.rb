class EventItem
  include Listable
  attr_reader :description, :start_date, :end_date#, :type

  def initialize(description, type, options={})
    @description = description
    @start_date = Date.parse(options[:start_date]) if options[:start_date]
    @end_date = Date.parse(options[:end_date]) if options[:end_date]
    #@type = type
  end
  # def type_name 
  #   "event"
  # end

  ## Deleted after moved to listable.rb module
  # def format_description
  #   "#{@description}".ljust(25)
  # end
  def format_date
    dates = @start_date.strftime("%D") if @start_date
    dates << " -- " + @end_date.strftime("%D") if @end_date
    dates = "N/A" if !dates
    return dates
  end

  
  def details
    format_description(@description) + "event dates: " + format_date #(@start_date, @end_date)
  end
end
