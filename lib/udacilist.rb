class UdaciList
  attr_reader :title, :items

  # New instance of Udacilist
  def initialize(options={})
    @title = ""
    @title = options[:title] 
    @items = []
  end
  
  def add(type, description, options={})
    type = type.downcase
    case type
    when "todo"
      @items.push TodoItem.new(description, options)
    when "event"
      @items.push EventItem.new(description, options)
    when "link"
      @items.push LinkItem.new(description, options)
    else
      raise UdaciListErrors::InvalidItemType "At this time #{type} is not supported"
    end
  end

  def delete(index)
    # index -= 1
    # raise UdaciListErrors::IndexExceedsListSize, "Item #{index} does not exist" unless @items.length > index 
    @items.delete_at(index - 1)
  end

  # added feature
  # def clear_list
  #  @title = "Empty List"
  #  puts "-" * new_title.length
  #  puts @title
  #  puts "-" * new_title.length
  #  counter = 0
  #    while counter < items.length
  #     items.delete_at(0)
  #   end
  # end


  # def filter(type)
  #   @title = "Filtered by #{type}"
  #   puts "-" * title.length
  #   puts@title
  #   puts "-" * title.length
  #   items.each_with_index do |item, i|
  #     if item.class.name.downcase.include? type
  #       puts puts "#{i + 1}) #{item.details}"
  #     else
  #     puts "Can not filter by #{type}. Type does not exist.".colorize(:yellow)
  #     end
  #   end
  # end
  def all  
    rows = []
    headings = ["item", "description"]
    @items.each_with_index do |item, position|
      rows.push([position+1, item.details])
    end
    table = Terminal::Table.new :title => @title, :headings => headings, :rows => rows
    puts table
    puts "\n\n"
  end
end

