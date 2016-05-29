module Listable

	def description
		format_description(description)
	end
  def format_description(description)
    "#{description}".ljust(30)
  end
end
