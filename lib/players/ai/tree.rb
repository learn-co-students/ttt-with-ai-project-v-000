
class Tree
    attr_accessor :node_count, :max_level, :nodes_at_level
    attr_reader :root_node

    def initialize(root_node)
        @root_node = TreeNode.new(data: root_node, tree: self)
        @nodes_at_level = {1 => [@root_node]}
        @node_count = 1
        @max_level = 1
    end

    def add_child(child, parent)
        parent.add_child(child)
    end

    def bfs
        seen = Set.new
        queue = []
        queue << self.root_node
        seen.add(self.root_node.data)
        while queue.length > 0
            curr_node = queue.shift
            match = yield(curr_node.data)
            return curr_node.data if match
            queue.concat(curr_node.children.select{|data| !!seen.add?(data)})
        end
        return nil
    end

    def dfs
        seen = Set.new
        stack = []
        stack << self.root_node
        seen.add(self.root_node.data)
        while stack.length > 0
            curr_node = stack.pop
            match = yield(curr_node.data)
            return curr_node.data if match
            stack.concat(curr_node.children.select{|data| !!seen.add?(data)})
        end
        return nil
    end

    def dfs_nodes
        stack = []
        stack << self.root_node
        while stack.length > 0
            curr_node = stack.pop
            match = yield(curr_node)
            return curr_node.data if match
            stack.concat(curr_node.children)
        end
        return nil
    end

    def dfs_revisit_if
        stack = []
        stack << self.root_node
        while stack.length > 0
            curr_node = stack.pop
            match = yield(curr_node)
            stack << curr_node if match
            stack.concat(curr_node.children)
        end
        return nil
    end

    def dfs_from_node(node)
        seen = Set.new
        stack = []
        stack << node
        seen.add(node)
        while stack.length > 0
            curr_node = stack.pop
            match = yield(curr_node.data)
            return curr_node.data if match
            stack.concat(curr_node.children.select{|data| !!seen.add?(data)})
        end
        return nil
    end

    def bfs_from_node(node)
        seen = Set.new
        queue = []
        queue << node
        seen.add(node)
        while queue.length > 0
            curr_node = queue.shift
            match = yield(curr_node.data)
            return curr_node.data if match
            queue.concat(curr_node.children.select{|data| !!seen.add?(data)})
        end
        return nil
    end

    def traverse_descendents_by_generation_from_node(node)
        next_gen = node.children
        while next_gen.length > 0
            yield(next_gen)
            desc = []
            next_gen.each do |node|
                desc.concat(node.children)
            end
            next_gen = desc
        end
    end


    def df_construct
        stack = []
        stack << self.root_node
        while stack.length > 0
            curr_node = stack.pop
            yield(curr_node)
            stack.concat(curr_node.children)
        end
    end

    def df_partial_construct
      stack = []
      self.dfs_nodes do |node|
        stack << node if node.children.length == 0
        false
      end
      while stack.length > 0
          curr_node = stack.pop
          yield(curr_node)
          stack.concat(curr_node.children)
      end
    end

end


class TreeNode
    attr_accessor :data, :tree, :level, :exiting_vectors, :entering_vector

    def initialize(data:, tree:, parent_vector: nil, exiting_vectors: [])
        @data = data
        @entering_vector = parent_vector
        @tree = tree
        @tree.node_count += 1 if !!parent
        @level = !!parent ? parent.level + 1 : 1
        @tree.max_level = @level if @level > @tree.max_level if !!parent
        (!!@tree.nodes_at_level[@level] ? @tree.nodes_at_level[@level] << self : @tree.nodes_at_level[@level] = [self]) if !!parent
        @exiting_vectors = []

    end

    def children
        self.exiting_vectors.map{|v| v.to}
    end

    def parent
        !!self.entering_vector ? self.entering_vector.from : nil
    end

    def siblings
        !!@parent ? @parent.children : self
    end

    def siblings_exclusive
        self.siblings.reject{|c| c == self}
    end

    def cousins
        if !!self.parent && !!self.parent.parent
            return @parent.parent.children.map{|gen| gen.children}.flatten
        elsif !!self.parent
            return self.siblings
        end
        self
    end

    def cousins_exclusive
        self.cousins.reject{|c| c == self}
    end

    def add_child_data(child_data, vector_data = nil)
        vector = TreeVector.new(data: vector_data, from: self)
        child = TreeNode.new(data: child_data, tree: self.tree, parent_vector: vector)
        vector.to = child
        self.exiting_vectors << vector
    end

    def add_child(child)
        self.children << child
    end

    def add_children_data(children_data)
        children_data.each do |data|
             add_child_data(data, nil)
        end
    end


    #hash of vector => children
    def add_children_and_vector_data(vector_child_arr)
        vector_child_arr.each do |hash|
            hash.each do |vector, child|
                add_child_data(child, vector)
            end
        end
    end

    def add_children(children)
        vectors = children.map{|n| n.entering_vector}
        self.exiting_vectors.concat(vectors)
    end

    def children_data
        self.children.map{|c| c.data}
    end

end

class TreeVector

    attr_accessor :to, :from, :data

    def initialize(to: nil, from: nil, data:)
        @to = to
        @from = from
        @data = data
    end

    def follow
        @to
    end

    def return
        @from
    end

end
