module Listable
	attr_reader :type, :description, :due
  attr_accessor :priority

  def format_description(description)
    "#{description}".ljust(25)
  end

  # started with method from todo.rb 
  # I tried Chronic.parse first but got TypeError: no implicit conversion of Time into String so use strttime
  def format_date(start_date, end_date = nil)
    if end_date
    dates = start_date.strftime("%D") if start_date
    dates << " -- " + end_date.strftime('%D') if end_date
    dates = "N/A" if !dates
    return dates 
    else 
      return start_date ? start_date.strftime("%D") : "N/A"
    end
  end

  def format_name
    @site_name ? @site_name : ""
  end

  # format priority started with method from todo.rb
  def format_priority(priority)
    case priority
    when "high"
    value = " ⇧".colorize(:red)
    when "medium"
    value = " ⇨".colorize(:blue) 
    when "low"
    value = " ⇩".colorize(:white) 
    else
    value = ""
    end
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


