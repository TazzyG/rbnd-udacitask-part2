class TodoItem
  include Listable

  attr_reader :description, :due, :type
  attr_accessor :priority

  def initialize(description, type, options={})
    @description = description
    @due = Chronic.parse(options[:due]) 
    @type = type
  end
 
  def details
    format_description(@description) + "due: " +
    format_date(@due) 
    format_priority(@priority)
  end
  def type_name 
    "todo"
  end
  def change_priority(priority)
    if (priority && !(priority == "high" || priority == "medium" || priority == "low") )
        raise UdaciListErrors::InvalidItemType, priority + " is not a valid priority"
    end
    @priority = priority
  end
end
