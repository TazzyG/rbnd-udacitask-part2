# Superclass, place event, todo, listable as subclasses

class Item
  include Listable

  attr_reader :description
  #todo 
  def initialize(description, type, options={}) 
  	unless type == link
    	@description = description
    end
    if @type == link 
    	@url = description	
    end
    @due = options[:due] ? Date.parse(options[:due]) : options[:due]
    @priority = options[:priority]
    # @type = type
  end  
  #todo 
  def initialize(description, type, options={})
    @description = description
    @due = options[:due] ? Date.parse(options[:due]) : options[:due]
    @priority = options[:priority]
    # @type = type
  end
  #link
  def initialize(url, options={})
    @description = url
    @site_name = options[:site_name]
    #@type = type
  end
  #event
  def initialize(description, type, options={})
    @description = description
    @start_date = Date.parse(options[:start_date]) if options[:start_date]
    @end_date = Date.parse(options[:end_date]) if options[:end_date]
    #@type = type
  end




  ###### Start, moved over to listable module 
  # def format_description
  #   "#{@description}".ljust(25)
  # end
  # def format_date
  #   @due ? @due.strftime("%D") : "No due date"
  # end
  # def format_priority
  #   value = " ⇧" if @priority == "high"
  #   value = " ⇨" if @priority == "medium"
  #   value = " ⇩" if @priority == "low"
  #   value = "" if !@priority
  #   return value
  # end
  ###### End, moved over to listable module
 
  def details
    format_description(@description) + "due: " +
    format_date(@due) 
    format_priority(@priority)
  end
  # def type_name 
  #   "todo"
  # end
  # def change_priority(priority)
  #   if (priority && !(priority == "high" || priority == "medium" || priority == "low") )
  #       raise UdaciListErrors::InvalidItemType, priority + " is not a valid priority"
  #   end
  #   @priority = priority
  # end
end

class Todo < Item

	attr_reader :due
	attr_accessor :priority


end

class Link < Item
	attr_reader :site_name

end

class Event < Item
	attr_reader :start_date, :end_date

end

