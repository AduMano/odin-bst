# frozen_string_literal: true

require('colorize')
require_relative('lib/tree')

# Initialize
tree = Tree.new

list = [1,2,3,4,5,3]

tree.build_tree(list)

tree.pretty_print
