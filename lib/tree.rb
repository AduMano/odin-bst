# frozen_string_literal: true

require_relative('node')

# Class Tree
class Tree
  def initialize
    @root = Node.new(5, Node.new(3, Node.new(2), Node.new(4)), Node.new(8, Node.new(7), Node.new(9)))
  end

  def pretty_print(node = @root, prefix = '', is_left = true) # rubocop:disable Style/OptionalBooleanParameter
    return nil if node.nil?

    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end
end
