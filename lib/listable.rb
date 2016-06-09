module Listable
	attr_reader :type, :description

  # Starts as empty

	# def description
	# 	format_description(description)
	# end
  def format_description(description)
    "#{description}".ljust(25)
  end

  def type
    @type 
  end

  # do we need change_priority here? or do we want to leave it in to.do?
end


