module Listable

	def description
		format_description(description)
	end
  def format_description(description)
    "#{description}".ljust(30)
  end

  def format_date
	#This method should take in either 1 or 2 dates since TodoItem requires formatting 1 date, while EventItem could have up to 2 dates
	end

	def title
		puts "-".colorize(:light_blue) * title.length
    puts @title
    puts "-".colorize(:light_blue) * title.length
	end

	def format_priority
	end
end

#if something_bad_happens
#  raise ModuleName::ErrorName, "Scanner Communication Error..."
#end
