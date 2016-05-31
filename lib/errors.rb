module UdaciListErrors
  # Error classes go here
  class InvalidItemType < StandardError
  end

  class IndexExceedsListSize < StandardError
  end

  class InvalidPriorityValue < StandardError
  end

  # Errors for any new features go here
end

# Lesson reminders to raise an error using modules
#if something_bad_happens
#  raise ModuleName::ErrorName, "Scanner Communication Error..."
#  raise UdaciListErrors::InvalidItemType, "Must be to, event, or link"
#end
