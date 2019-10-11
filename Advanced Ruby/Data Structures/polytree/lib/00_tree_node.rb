class PolyTreeNode 
  
  attr_reader :parent, :children, :value
  attr_writer :children

  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end

  def parent=(parent)
    @parent.children.delete(self) if @parent
    @parent = parent
    @parent.children << self if parent
  end

  def add_child(child_node)
    child_node.parent = self
  end

  def remove_child(child_node)
    raise 'node is not a child' unless child_node.parent

    child_node.parent = nil
  end

  def dfs(target_value)
    return self if @value == target_value

    children.each do |child|
      result = child.dfs(target_value)
      return result unless result.nil?
    end
    nil
  end

  def bfs(target_value)
    queue = [self]
    until queue.empty?
      curr = queue.shift
      return curr if curr.value == target_value

      queue.concat(curr.children)
    end
    nil
  end
end
