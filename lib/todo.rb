class TodoItem
  include Listable

  attr_reader :description, :due#, :type
  attr_accessor :priority

  def initialize(description, type, options={})
    @description = description
    @due = options[:due] ? Date.parse(options[:due]) : options[:due]
    @priority = options[:priority]
    # @type = type
  end
  def format_date
    @due ? @due.strftime("%D") : "No due date"
  end
  def format_priority
    value = " ⇧".colorize(:red) if @priority == "high"
    value = " ⇨".colorize(:blue) if @priority == "medium"
    value = " ⇩".colorize(:white) if @priority == "low"
    value = "" unless @priority
    return value
  end
  def details
    format_description(@description) + "due: " +
    format_date +
    format_priority
  end
end
