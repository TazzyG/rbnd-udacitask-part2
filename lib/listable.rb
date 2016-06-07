module Listable

	# def description
	# 	format_description(description)
	# end
  def format_description(description)
    "#{description}".ljust(30)
  end

  def format_priority(priority)
    if (priority && !(priority == "high" || priority == "medium" || priority == "low") )
        raise UdaciListErrors::InvalidPriorityValue, priority + " is not a valid priority"
    end
    value = " ⇧".colorize(:red) if @priority == "high"
    value = " ⇨".colorize(:yellow) if @priority == "medium"
    value = " ⇩".colorize(:green) if @priority == "low"
    value = "" if !@priority  
  end

  def format_date(start_date, end_date = false)
    start_date = nil
    end_date = nil
    dates = Chronic.parse(start_date).strftime("%D") if start_date
    dates << " -- " + Chronic.parse(end_date).strftime("%D") if end_date
    dates = "No due date" if !dates
    return dates
  end
  # do we need change_priority here? or do we want to leave it in to.do?
end


