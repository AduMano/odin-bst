# frozen_string_literal: true

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

print "\nDeleting Leaf Node 11: "
puts "Node #{tree.delete(11).data} deleted."

puts "\nTree: "
tree.pretty_print

puts "\nPre-Order: #{tree.preorder.to_s.colorize(:yellow)}"
puts "In-Order: #{tree.inorder.to_s.colorize(:yellow)}"
puts "Post-Order: #{tree.postorder.to_s.colorize(:yellow)}"

print "\nDeleting Node with 1 Child 0: "
puts "Node #{tree.delete(0).data} deleted."

puts "\nTree: "
tree.pretty_print

puts "\nPre-Order: #{tree.preorder.to_s.colorize(:yellow)}"
puts "In-Order: #{tree.inorder.to_s.colorize(:yellow)}"
puts "Post-Order: #{tree.postorder.to_s.colorize(:yellow)}"

print "\nDeleting Node with 1 Child 12: "
puts "Node #{tree.delete(12).data} deleted."

puts "\nTree: "
tree.pretty_print

puts "\nPre-Order: #{tree.preorder.to_s.colorize(:yellow)}"
puts "In-Order: #{tree.inorder.to_s.colorize(:yellow)}"
puts "Post-Order: #{tree.postorder.to_s.colorize(:yellow)}"

print "\nDeleting Node with both Child (Node 2): "
puts "Node #{tree.delete(2).data} deleted."

puts "\nTree: "
tree.pretty_print

puts "\nPre-Order: #{tree.preorder.to_s.colorize(:yellow)}"
puts "In-Order: #{tree.inorder.to_s.colorize(:yellow)}"
puts "Post-Order: #{tree.postorder.to_s.colorize(:yellow)}"

print "\nDeleting Node with both Child (Node 10): "
puts "Node #{tree.delete(10).data} deleted."

puts "\nTree: "
tree.pretty_print

puts "\nPre-Order: #{tree.preorder.to_s.colorize(:yellow)}"
puts "In-Order: #{tree.inorder.to_s.colorize(:yellow)}"
puts "Post-Order: #{tree.postorder.to_s.colorize(:yellow)}"

print "\nDeleting Node with both Child (Node 13): "
puts "Node #{tree.delete(13).data} deleted."

puts "\nTree: "
tree.pretty_print

puts "\nPre-Order: #{tree.preorder.to_s.colorize(:yellow)}"
puts "In-Order: #{tree.inorder.to_s.colorize(:yellow)}"
puts "Post-Order: #{tree.postorder.to_s.colorize(:yellow)}"

puts "\n#{tree.level_order.to_s.colorize(:blue)}"

puts "Height: #{tree.height.to_s.colorize(:red)}"

find_test = tree.find(4)
print "\nFind 4: "
puts find_test.to_s.colorize(:yellow)

puts "Height: #{tree.height(find_test).to_s.colorize(:red)}"

find_test = tree.find(5)
print "\nFind 5: "
puts find_test.to_s.colorize(:yellow)

puts "Depth: #{tree.depth(find_test).to_s.colorize(:red)}"

print "\nIs Balanced?: "
puts tree.balanced?.to_s.colorize(:yellow)

print "\ninsert(10): "
puts tree.insert(10).to_s.colorize(:yellow)
print "\ninsert(11): "
puts tree.insert(11).to_s.colorize(:yellow)
print 'insert(12): '
puts tree.insert(12).to_s.colorize(:yellow)
print 'insert(13): '
puts tree.insert(13).to_s.colorize(:yellow)

puts "\nTree: "
tree.pretty_print

puts "\nPre-Order: #{tree.preorder.to_s.colorize(:yellow)}"
puts "In-Order: #{tree.inorder.to_s.colorize(:yellow)}"
puts "Post-Order: #{tree.postorder.to_s.colorize(:yellow)}"

puts "\nHeight: #{tree.height.to_s.colorize(:red)}"
print 'Is Balanced?: '
puts tree.balanced?.to_s.colorize(:yellow)

print "\nBalancing.... "
puts tree.rebalance.to_s.colorize(:yellow)

puts "\nTree: "
tree.pretty_print

puts "\nPre-Order: #{tree.preorder.to_s.colorize(:yellow)}"
puts "In-Order: #{tree.inorder.to_s.colorize(:yellow)}"
puts "Post-Order: #{tree.postorder.to_s.colorize(:yellow)}"
print 'Is Balanced?: '
puts tree.balanced?.to_s.colorize(:yellow)

print "\nDeleting Node with both Child (Node 10): "
puts "Node #{tree.delete(10).data} deleted."

puts "\nTree: "
tree.pretty_print