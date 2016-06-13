class UdaciList
  attr_reader :title, :items, :type

  # New instance of Udacilist
  def initialize(options={})
    @title = ""
    @title = options[:title]
    @items = []
  end
  
  def add(type, description, options={})
    if (options.has_key? :priority) &&(!["low", "high", "medium"].include? options[:priority])
      raise UdaciListErrors::InvalidPriorityValue, "Please choose from low, medium or high, instead of #{options[:priority]}, OK?"
    end
    type = type.downcase
    case type
    when "todo"
      @items.push TodoItem.new(description, options)
    when "event"
      @items.push EventItem.new(description, options)
    when "link"
      @items.push LinkItem.new(description, options)
    else
      raise UdaciListErrors::InvalidItemType, "At this time, add #{type} is not supported"
    end
    
  end

  def change_priority(index, priority)
    todo = @items[index-1]
    todo.change_priority(priority)
  end

  def push_out_date(index, number_of_days)
    if 
    event = @items[index-1] 
    event.move_dates(number_of_days)
    end
  end

  def delete(index)
    raise UdaciListErrors::IndexExceedsListSize, "Item #{index} does not exist" if @items.length < index 
    @items.delete_at(index -1)
  end

  # added feature
  def clear_list
   @title = "Empty List"
   @items = []
  end

  def filter(type)
    item_class = { "todo" => TodoItem, "event" => EventItem, "link" => LinkItem }
    rows = @items.select { |item| item.class == item_class[type] }.map { |item| [item.details] }
    filtered_table = Terminal::Table.new :title => type, :rows => rows
    puts filtered_table
    puts "\n"
  end
  def all   
    rows = []
    headings = ["item".colorize(:blue), "type".colorize(:yellow),"description".colorize(:blue)]   
    @items.each_with_index do |item, position|
      rows.push([position+1, item.type , item.details])
    end
    table = Terminal::Table.new :title => @title, :headings => headings, :rows => rows
    puts table
    puts "\n"
  end
end

