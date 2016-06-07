class UdaciList
  attr_reader :title, :items

  def initialize(options={})
    options[:title].nil? ? @title = 'Untitled List' : @title = options[:title]
    @items = []
  end
  
  def add(type, description, options={})
    type = type.downcase
    types = %w(todo event link)
    @items.push TodoItem.new(description, options) if type == 'todo'
    @items.push EventItem.new(description, options) if type == 'event'
    @items.push LinkItem.new(description, options) if type == 'link'
    raise UdaciListErrors::UnsupportedItemType, "Object #{type} is not supported" unless types.include? type
  end

  def delete(index)
    index -= 1
    raise UdaciListErrors::IndexExceedsListSize, "Item #{index} does not exist" unless @items.length > index 
    @items.delete_at(index - 1)
  end

  # added feature
  def clear_list
   @title = "Empty List"
   puts "-" * new_title.length
   puts @title
   puts "-" * new_title.length
   counter = 0
     while counter < items.length
      items.delete_at(0)
    end
  end


  def filter(type)
    @title = "Filtered by #{type}"
    puts "-" * title.length
    puts@title
    puts "-" * title.length
    items.each_with_index do |item, i|
      if item.class.name.downcase.include? type
        puts puts "#{i + 1}) #{item.details}"
      else
      puts "Can not filter by #{type}. Type does not exist.".colorize(:yellow)
      end
    end
  end
  def all
    title if @title
    puts "-" * @title.length
    puts @title
    puts "-" * @title.length

    @items.each_with_index do |item, i|
      puts "#{i + 1}) #{item.details}"
    end
  end
end

