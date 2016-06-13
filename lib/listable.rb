module Listable
	attr_reader :type, :description, :due
  attr_accessor :priority

  def format_description(description)
    "#{description}".ljust(25)
  end

  # format date from todo.rb
  def format_date(start_date, end_date)
    @end_date ? @end_date.strftime("%D") if @end_date
    @dates = @start_date.strftime("%D") if @start_date
    @dates << " -- " + @end_date.strftime("%D") if @end_date
    @dates = "N/A" unless dates
    return dates
  end

  def format_name
    @site_name ? @site_name : ""
  end

  # # from event.rb before refactoring
  # def format_duration_date(start_date, end_date)
  #   dates = @start_date.strftime("%D") if @start_date
  #   dates << " -- " + @end_date.strftime("%D") if @end_date
  #   dates = "N/A" unless dates
  #   return dates
  # end

  # format priority from todo.rb
  def format_priority(priority)
    case value
    when "high"
    value = " ⇧".colorize(:red)
    when "medium"
    value = " ⇨".colorize(:blue) 
    when "low"
    value = " ⇩".colorize(:white) if @priority == "low"
    else
    value = "" 
  end

  # change priority from todo.rb
  def change_priority(priority)
    @priority = priority
    unless @priority =="low" || "high" || "medium"
      raise UdaciListErrors::InvalidPriorityValue, "Please choose from low, medium or high, instead of #{options[:priority]}, OK?"
    end
  end




  def type
    @type 
  end
end


