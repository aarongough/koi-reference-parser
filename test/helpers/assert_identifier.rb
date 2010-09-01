def assert_identifier(tree)
  assert_kind_of Block, tree
  assert_kind_of Statement, tree.elements.first
  assert_kind_of Assignment, tree.elements.first.elements.last
  assert_kind_of Identifier, tree.elements.first.elements.last.elements.first
end