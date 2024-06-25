# frozen_string_literal: true

require('colorize')
require_relative('lib/tree')

# Initialize
tree = Tree.new

list = [10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 0]

tree.build_tree(list)

puts 'Build Tree [10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 0]: '
tree.pretty_print

puts "\nPre-Order: #{tree.preorder.to_s.colorize(:yellow)}"
puts "In-Order: #{tree.inorder.to_s.colorize(:yellow)}"
puts "Post-Order: #{tree.postorder.to_s.colorize(:yellow)}"

print "\ninsert(11): "
puts tree.insert(11).to_s.colorize(:yellow)
print 'insert(12): '
puts tree.insert(12).to_s.colorize(:yellow)
print 'insert(13): '
puts tree.insert(13).to_s.colorize(:yellow)
print 'insert(13): '
puts tree.insert(13).to_s.colorize(:yellow)
print 'insert(13): '
puts tree.insert(13).to_s.colorize(:yellow)

puts "\nPre-Order: #{tree.preorder.to_s.colorize(:yellow)}"
puts "In-Order: #{tree.inorder.to_s.colorize(:yellow)}"
puts "Post-Order: #{tree.postorder.to_s.colorize(:yellow)}"

puts "\nTree: "
tree.pretty_print

print "\nRebalance The Tree: "
puts tree.rebalance.to_s.colorize(:yellow)

puts "\nTree: "
tree.pretty_print

puts "\nPre-Order: #{tree.preorder.to_s.colorize(:yellow)}"
puts "In-Order: #{tree.inorder.to_s.colorize(:yellow)}"
puts "Post-Order: #{tree.postorder.to_s.colorize(:yellow)}"
