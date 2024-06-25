# frozen_string_literal: true

require_relative('node')
require_relative('modules/helper')
require_relative('modules/comparable')

# Class Tree
class Tree
  include ArrayHelper
  include SortHelper
  include Comparable

  def initialize
    @root = nil
  end

  def build_tree(list)
    return false if list.empty?

    unique_list = elim_duplicates(list)
    sorted_list = merge_sort(unique_list)

    @root = balance_tree(sorted_list, 0, sorted_list.length - 1)
    true
  end

  def insert(data, new_node = Node.new(data), root = @root)
    return false if find(data).eql?(true)
    return @root = new_node if root.nil?

    if compare_nodes(data, root)
      return root.right = new_node if root.right.nil?

      insert(data, new_node, root.right)
    else
      return root.left = new_node if root.left.nil?

      insert(data, new_node, root.left)
    end
  end

  def preorder(list = [], root = @root, &block)
    if block_given?
      return root if yield(root).eql?(true)
    else
      list.push(root.data)
    end

    preorder(list, root.left, &block) unless root.left.nil?
    preorder(list, root.right, &block) unless root.right.nil?

    list unless block_given?
  end

  def inorder(list = [], root = @root, &block)
    inorder(list, root.left, &block) unless root.left.nil?

    if block_given?
      return root if yield(root).eql?(true)
    else
      list.push(root.data)
    end

    inorder(list, root.right, &block) unless root.right.nil?

    list unless block_given?
  end

  def postorder(list = [], root = @root, &block)
    postorder(list, root.left, &block) unless root.left.nil?
    postorder(list, root.right, &block) unless root.right.nil?

    if block_given?
      return root if yield(root).eql?(true)
    else
      list.push(root.data)
    end

    list unless block_given?
  end

  def find(data)
    inorder do |node|
      return true if node.data.eql?(data)
    end

    false
  end

  def rebalance
    sorted_list = inorder

    @root = balance_tree(sorted_list, 0, sorted_list.length - 1)
    true
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
