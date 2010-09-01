def assert_expression(tree, operator = nil)
  assert_kind_of Block, tree
  assert_kind_of Statement, tree.elements.first
  assert_kind_of Assignment, tree.elements.first.elements.last
  assert_kind_of Identifier, tree.elements.first.elements.last.elements[0]
  assert_kind_of AssignmentOperator, tree.elements.first.elements.last.elements[1]
  assert_kind_of Expression, tree.elements.first.elements.last.elements[2]
  assert_equal 3, tree.elements.first.elements.last.elements[2].elements.first.elements.size
  assert_kind_of operator, tree.elements.first.elements.last.elements[2].elements.first.elements[1] unless(operator.nil?)
end