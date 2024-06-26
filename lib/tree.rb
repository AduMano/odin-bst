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

  def insert(data, new_node = Node.new(data, nil, nil, nil), root = @root)
    return @root = new_node if root.nil?
    return false unless find(data).eql?(false)

    if compare_nodes(data, root)
      if root.right.nil?
        new_node.parent = root
        return root.right = new_node
      end

      insert(data, new_node, root.right)
    else
      if root.left.nil?
        new_node.parent = root
        return root.left = new_node
      end

      insert(data, new_node, root.left)
    end
  end

  def delete(data)
    node = find(data)
    return false if node.eql?(false)

    if node.left.nil? && node.right.nil?
      # If its a leaf node (No Children or Nil nodes for left and right)
      delete_leaf(data, node)
    elsif node.left.nil? ^ node.right.nil?
      # If theres only one child (exclusive or, cant be both true)
      delete_node_with_child(data, node)
    else
      # If node has children both side
      delete_node_with_children(data, node)
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
    node = preorder do |current_node|
      return current_node if current_node.data.eql?(data)
    end

    node.eql?(nil) ? false : node
  end

  # Iterative Approach
  # def level_order(node = @root, queue = [], level_order_of_nodes = [], level = 0, &block)
  #   return if node.nil?

  #   queue.push(node)

  #   until queue.empty?
  #     current = queue[0]
  #     block_given? ? yield(current, level, node) : level_order_of_nodes.push(current.data)

  #     queue.push(current.left) unless current.left.nil?
  #     queue.push(current.right) unless current.right.nil?

  #     queue.shift
  #   end

  #   level_order_of_nodes unless block_given?
  # end

  # Recursive Approach
  def level_order(node = @root, queue = [], level_order_of_nodes = [], level = 0, &block)
    return if node.nil?

    queue.push(node) if queue.empty?

    current = queue[0]
    block_given? ? yield(current, level, node) : level_order_of_nodes.push(current.data)

    queue.push(current.left) unless current.left.nil?
    queue.push(current.right) unless current.right.nil?
    queue.shift

    level_order(node.left, queue, level_order_of_nodes, level + 1, &block)
    level_order(node.right, queue, level_order_of_nodes, level + 1, &block)

    level_order_of_nodes unless block_given?
  end

  def depth(node = @root)
    return nil if node.nil?

    level_order { |_, level, current_node| return level if node.data.eql?(current_node.data) }
  end

  def height(node = @root)
    return nil if node.nil?

    height = 0
    level_order(node) { |_, level| height = level if level > height }

    height
  end

  def balanced?
    left = height(@root.left)
    right = height(@root.right)

    (left - right).abs <= 1
  end

  def rebalance
    sorted_list = inorder

    @root = balance_tree(sorted_list, 0, sorted_list.length - 1)
    true
  end

  def pretty_print(node = @root, prefix = '', is_left = true)
    return nil if node.nil?

    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data.to_s.colorize(:yellow)}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end

  private

  def balance_tree(list, front, back, parent_root = nil)
    return nil if front > back

    mid = ((front + back) / 2).floor
    root = Node.new(list[mid], nil, nil, parent_root)

    root.left = balance_tree(list, front, mid - 1, root)
    root.right = balance_tree(list, mid + 1, back, root)
    root.parent = parent_root

    root
  end

  def delete_leaf(data, node)
    # If deleted node's value greater than parent's value
    # set the parents' right connection to nil, else set the left to nil
    compare_nodes(data, node.parent) ? node.parent.right = nil : node.parent.left = nil
    node
  end

  def delete_node_with_child(data, node)
    # If deleted node's value is greater than parent's value then
    if compare_nodes(data, node.parent)
      # Set the parent's right connection to the deleted node's child
      node.parent.right = node.left.nil? ? node.right : node.left
    else
      # Set the parent's left connection to the deleted node's child
      node.parent.left = node.left.nil? ? node.right : node.left
    end

    # Update the deleted node's child parent to the deleted node's parent
    update_parent(node)
    node
  end

  def delete_node_with_children(data, node)
    # Get the next biggest data of the deleted node
    next_biggest_node = get_next_biggest_node(data, node)

    # Make a copy to return the deleted node
    disposed_node = Node.new(data, node.left, node.right, node.parent)

    # Delete the next biggest node (Since its a leaf, theres no changes)
    deleted_next_biggest_node = delete_leaf(next_biggest_node.data, next_biggest_node)

    # Use the deleted next biggest node's data to replace the value of this current node
    node.data = deleted_next_biggest_node.data

    disposed_node
  end

  def get_next_biggest_node(data, node)
    inorder([], node) do |sel_node|
      return sel_node if sel_node.data > data
    end
  end

  def update_parent(node)
    node.left.nil? ? node.right.parent = node.parent : node.left.parent = node.parent
  end
end
