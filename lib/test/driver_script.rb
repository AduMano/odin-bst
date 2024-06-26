# frozen_string_literal: true

tree = Tree.new

# Objective 1: Create a binary search tree from an array of random numbers (Array.new(15) { rand(1..100) })
list = (Array.new(15) { rand(1..100) })
tree.build_tree(list)

puts "List: #{list.to_s.colorize(:yellow)}"
puts 'Tree: '
tree.pretty_print

# Objective 2: Confirm that the tree is balanced by calling #balanced?
print "\nIs the Tree balanced? "
puts tree.balanced?.to_s.colorize(:yellow)

# Objective 3: Print out all elements in level, pre, post, and in order
puts "\nPre-Order: #{tree.preorder.to_s.colorize(:yellow)}"
puts "Post-Order: #{tree.postorder.to_s.colorize(:yellow)}"
puts "In-Order: #{tree.inorder.to_s.colorize(:yellow)}"

# Objective 4: Unbalance the tree by adding several numbers > 100
num = rand(100..150)
print "\nInsert Node (#{num}): "
puts tree.insert(num).to_s.colorize(:yellow)

num = rand(100..150)
print "Insert Node (#{num}): "
puts tree.insert(num).to_s.colorize(:yellow)

num = rand(100..150)
print "Insert Node (#{num}): "
puts tree.insert(num).to_s.colorize(:yellow)

num = rand(100..150)
print "Insert Node (#{num}): "
puts tree.insert(num).to_s.colorize(:yellow)

num = rand(100..150)
print "Insert Node (#{num}): "
puts tree.insert(num).to_s.colorize(:yellow)

puts "\nTree: "
tree.pretty_print

# Objective 5: Confirm that the tree is unbalanced by calling #balanced?
print "\nIs the Tree balanced? "
puts tree.balanced?.to_s.colorize(:yellow)

puts "\nBalancing..... #{tree.rebalance.to_s.colorize(:yellow)}"

puts "\nTree: "
tree.pretty_print

# Objective 6: Confirm that the tree is balanced by calling #balanced?
print "\nIs the Tree balanced? "
puts tree.balanced?.to_s.colorize(:yellow)

# Objective 7: Print out all elements in level, pre, post, and in order.
puts "\nPre-Order: #{tree.preorder.to_s.colorize(:yellow)}"
puts "Post-Order: #{tree.postorder.to_s.colorize(:yellow)}"
puts "In-Order: #{tree.inorder.to_s.colorize(:yellow)}"
