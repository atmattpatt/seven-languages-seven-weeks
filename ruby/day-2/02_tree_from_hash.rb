class Tree
  attr_accessor :name, :children

  def initialize(definition = {})
    @name = definition.keys[0]
    @children = []

    definition[@name].each { |k, v| @children << Tree.new(k => v) }
  end

  def visit_all(&block)
    visit &block
    @children.each { |c| c.visit_all &block }
  end

  def visit(&block)
    block.call self
  end
end

ruby_tree = Tree.new({
  "grandpa" => {
    "dad" => {
      "child 1" => {},
      "child 2" => {},
    },
    "uncle" => {
      "child 3" => {},
      "child 4" => {},
    },
  }
})

puts "Visiting a node"
ruby_tree.visit { |node| puts node.name }
puts

puts "Visiting the tree"
ruby_tree.visit_all { |node| puts node.name }
