module Listable

	def description
		format_description(description)
	end
  def format_description(description)
    "#{description}".ljust(30)
  end

  def format_date(options = {})
	#This method should take in either 1 or 2 dates since TodoItem requires formatting 1 date, while EventItem could have up to 2 dates
		# event.rb method
		case options.length
		when 1
			# todo.rb
    options[:due ] ? options[:due].strftime("%D") : "No due date"
  	when 2 
    dates = options[:start_date].strftime("%D") if options[:start_date]
    dates << " -- " + options[:end_date].strftime("%D") if otions[:end_date]
    dates = "N/A" unless dates
    dates   
    else 
    	''
    end
	end

	def title
		puts "-".colorize(:light_blue) * title.length
    puts @title
    puts "-".colorize(:light_blue) * title.length
	end

	def format_priority
	end
end


