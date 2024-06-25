# frozen_string_literal: true

# Comparable Modules
module Comparable
  def compare_nodes(new_node, node)
    new_node > node.data
  end
end
