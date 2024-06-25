# frozen_string_literal: true

# Helper Module
module SortHelper
  def merge(left, right) # rubocop:disable Metrics/MethodLength
    merged = []
    i = j = 0

    while i < left.length && j < right.length
      if left[i] <= right[j]
        merged.push(left[i])
        i += 1
      else
        merged.push(right[j])
        j += 1
      end
    end

    merged.concat(left[i..] + right[j..])
    merged
  end

  def merge_sort(list)
    return list if list.count < 2

    half = (list.count / 2).floor
    left = merge_sort(list[0..half - 1]) # Returns an list
    right = merge_sort(list[half..]) # Returns an list

    merge(left, right)
  end
end

# Array
module ArrayHelper
  def elim_duplicates(list, new_list = [], accumulator = 0)
    return new_list if accumulator >= list.length

    if list_has?(new_list, list[accumulator])
      elim_duplicates(list, new_list, accumulator + 1)
    else
      elim_duplicates(list, new_list.push(list[accumulator]), accumulator + 1)
    end
  end

  def list_has?(list, target, accumulator = 0)
    return true if list[accumulator].eql?(target)
    return false if accumulator >= list.length

    list_has?(list, target, accumulator + 1)
  end
end
