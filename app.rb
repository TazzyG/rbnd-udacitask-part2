require 'date'

require 'chronic'
require 'colorize'

# Find a third gem of your choice and add it to your project
require 'terminal-table'

require_relative "lib/listable"
require_relative "lib/errors"
require_relative "lib/udacilist"
require_relative "lib/todo"
require_relative "lib/event"
require_relative "lib/link"

list = UdaciList.new(title: "Julia's Stuff")
list.add("todo", "Buy more cat food", due: "2016-02-03", priority: "low")
list.add("todo", "Sweep floors", due: "2016-01-30")
list.add("todo", "Buy groceries", priority: "high")
list.add("event", "Birthday Party", start_date: "2016-05-08")
list.add("event", "Vacation", start_date: "2016-05-28", end_date: "2016-05-31")
list.add("link", "https://github.com", site_name: "GitHub Homepage")
list.all # Should be 6 items
list.delete(3)
list.all # Should be 5 items

# SHOULD CREATE AN UNTITLED LIST AND ADD ITEMS TO IT
# --------------------------------------------------
new_list = UdaciList.new # Should create a list called "Untitled List"
new_list.add("todo", "Buy more dog food", due: "in 5 weeks", priority: "medium")
new_list.add("todo", "Go dancing", due: "in 2 hours")
new_list.add("todo", "Buy groceries", priority: "high")
new_list.add("event", "Birthday Party", start_date: "May 31")
new_list.add("event", "Vacation", start_date: "Dec 20", end_date: "Dec 30")
new_list.add("event", "Life happens")
new_list.add("link", "https://www.udacity.com/", site_name: "Udacity Homepage")
new_list.add("link", "http://ruby-doc.org")

new_list.all # Should be 8 items

# SHOULD RETURN ERROR MESSAGES
# ----------------------------
new_list.add("image", "http://ruby-doc.org") # Throws InvalidItemType error
new_list.delete(9) # Throws an IndexExceedsListSize error
new_list.add("todo", "Hack some portals", priority: "super high") # throws an InvalidPriorityValue error

# DISPLAY UNTITLED LIST
# ---------------------
new_list.all  # Should still be 8 items

# DEMO FILTER BY ITEM TYPE
# ------------------------
new_list.filter("event")


## My Tests ##
new_list.all  # Item 1 should be blue straight arrow
new_list.change_priority(1,"high")
new_list.all # Item 1 should now be red up arrow

# class EventPeriodError < StandardError
event_test = new_list.add("event", "Study Rails", start_date: "2016-6-1", end_date: "2015-9-1") # Should throw error
 
## Requirements 

# Each item should display its item_type along with the item description. - Done
# The last line of app.rb — list.filter(item_type) that takes an item_type as input and displays only list items of that type if they exist, or alerts the user if there aren't any items of that type. Done
# In addition to the two features above, add 2 more features of your choice: If you get stuck deciding on a new feature, here are some suggestions:

# Change the priority levels of items 
# Clear a list
# Move out an event by days

new_list.push_out_date(5, 10) 
new_list.all # birthday party should start 12/30/16 and end 01/09/17 

new_list.push_out_date(5, -300) #should see InvalidSchedule

