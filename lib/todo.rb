class TodoItem
  include Listable

  attr_reader :description, :due, 
  attr_accessor :priority

  def initialize(description, options={})
    @description = description
    @due = Chronic.parse(options[:due]) ? Chronic.parse(options[:due]) : Chronic.parse(options[:due])
    @priority = options[:priority]
  end
  # def format_date
  #   @due ? @due.strftime("%D") : "No due date"
  # end
  def format_priority(priority)
    value = " ⇧".colorize(:red) if @priority == "high"
    value = " ⇨".colorize(:yellow) if @priority == "medium"
    value = " ⇩".colorize(:green) if @priority == "low"
    value = "" unless priority
    value
  end
  def details
    format_description(@description) + "due: " +
    format_date 
    format_priority
  end
end
