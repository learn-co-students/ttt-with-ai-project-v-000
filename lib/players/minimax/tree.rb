class Tree
    attr_accessor :root, :node_by_board, :me
    def initialize(data, token)
        @node_by_board = {}
        @me = token
        @root = Node.new(data, self)
    end

    def add_node(node)
        @node_by_board[node.data[:board]] = node
    end

end