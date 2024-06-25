# frozen_string_literal: true

require_relative('node')
require_relative('modules/helper')

# Class Tree
class Tree
  include ArrayHelper
  include SortHelper

  def initialize
    @root = nil
  end

  def build_tree(list)
    return nil if list.empty?

    unique_list = elim_duplicates(list)
    sorted_list = merge_sort(unique_list)

    @root = balance_tree(sorted_list, 0, sorted_list.length - 1)
  end

  def pretty_print(node = @root, prefix = '', is_left = true) # rubocop:disable Style/OptionalBooleanParameter
    return nil if node.nil?

    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end

  private

  def balance_tree(list, front, back)
    return nil if front > back

    mid = ((front + back) / 2).floor
    root = Node.new(list[mid])

    root.left = balance_tree(list, front, mid - 1)
    root.right = balance_tree(list, mid + 1, back)

    root
  end
end
