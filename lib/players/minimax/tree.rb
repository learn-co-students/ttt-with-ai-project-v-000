class Tree
    attr_accessor :root, :node_by_board
    def initialize(data)
        @node_by_board = {}
        @root = Node.new(data, self)

    end

    def add_node(node)
        @node_by_board[node.data[:board]] = node
    end

end