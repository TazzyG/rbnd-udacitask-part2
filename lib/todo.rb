class TodoItem
  include Listable

  attr_reader :description, :due
  attr_accessor :priority
  
  def initialize(description, options={})
    @description = description
    @due = options[:due] ? Chronic.parse(options[:due]) : options[:due]
    @priority = options[:priority] || "low"
  end
    
  def format_date(due)
    @due ? @due.strftime("%D") : "No due date"
  end

  
  def change_priority(priority)
    @priority = priority
    unless @priority =="low" || "high" || "medium"
      raise UdaciListErrors::InvalidPriorityValue, "Please choose from low, medium or high, instead of #{options[:priority]}, OK?"
    end
  end

  def format_priority(priority)
    value = " ⇧".colorize(:red) if @priority == "high"
    value = " ⇨".colorize(:blue) if @priority == "medium"
    value = " ⇩".colorize(:white) if @priority == "low"
    value = "" unless @priority
    return value
  end
  def details
    format_description(@description) + "due: " +
    format_date(@due) +
    format_priority(@priority)
  end
end
