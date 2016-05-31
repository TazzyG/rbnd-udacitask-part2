class UdaciList
  attr_reader :title, :items

  def initialize(options={})
    @title = options[:title]
    @tite = "untitled"
    @items = []
  end
  
  def add(type, description, options={})
    type = type.downcase
    raise UdaciListErrors::InvalidItemType, "Sorry you can't add an #{type} in this app in this version" unless type == "todo" || type == "event" || type == "link"
    @items.push TodoItem.new(description, options) if type == "todo"
    @items.push EventItem.new(description, options) if type == "event"
    @items.push LinkItem.new(description, options) if type == "link"
  end

  def change_priority(index, add_priority)
    priorities = ['urgent', 'important', 'normal', 'low']
    select_item = @items[index-1]
    raise UdaciListErrors::InvalidPriorityValue, "High", "Medium", "low" unless  new_priority == "High" || new_priority == "medium" || new_priority == "low"
    add_priority = add_priority
  end

  def delete(index)
    raise UdaciListErrors::IndexExceedsListSize, "Item #{index} does not exit" unless @items.length > index 
    @items.delete_at(index - 1)
  end

  def filter(type)
    filtered = @items.select { |i| i.to_s.downcase.include? type.downcase }
    if filtered.empty?
      puts "Can not filter by #{type}. Type does not exist.".colorize(:yellow)
    end
    unless filtered.empty?
      puts
      puts "Filtered by #{type}"
      puts '-------------------'
      filtered.each_with_index do |item, position|
        puts "#{position + 1}) #{item.details}"
      end
    end
  end
  def all
      title if @title
    @items.each_with_index do |item, position|
      puts "#{position + 1}) #{item.details}"
    end
  end
end

