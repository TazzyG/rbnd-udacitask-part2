module UdaciListErrors
  # Error classes go here
  # * **Errors**: `InvalidItemType`, `IndexExceedsListSize`, and `InvalidPriorityValue` are used appropriately.
  class InvalidItemType < StandardError
  end

  class IndexExceedsListSize < StandardError
  end

  class InvalidPriorityValue < StandardError
  end

  # Errors for any new features go here
  class EventPeriodError < StandardError
  end

  class InvalidSchedule < StandardError
  end
end

# Lesson reminders to raise an error using modules
#if something_bad_happens
#  raise ModuleName::ErrorName, "Scanner Communication Error..."
#  raise UdaciListErrors::InvalidItemType, "Must be to, event, or link"
#end
