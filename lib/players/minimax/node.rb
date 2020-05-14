class Node
    attr_reader :children, :data

    WIN_COMBINATIONS = [
        [0,1,2],
        [3,4,5],
        [6,7,8],
        [0,4,8],
        [2,4,6],
        [0,3,6],
        [1,4,7],
        [2,5,8]
    ]
    def initialize(data, tree)
        @data = data
        @children = []
        @tree = tree
        generate_children
        if @children.length == 0
            case winner
            when 'O'
                @data[:score] = -10
            when 'X'
                @data[:score] = 10
            else
                @data[:score] = 0
            end
        else
            if @data[:turn] == 'X'
                #get maximum scores b/c this is us
                @data[:score] = @children.map{|c| c.data[:score]}.max
            else
                @data[:score] = @children.map{|c| c.data[:score]}.min
            end
        end

        @tree.add_node(self)
    end

    def add_child(child)
        @children << child
    end

    def generate_children
        get_empty_spaces(@data[:board]).each do |idx|
            new_board = @data[:board].dup
            new_board[idx] = @data[:turn]
            self.add_child(Node.new({board: new_board, turn: other_player, score: nil}, @tree))
        end
    end

    def won?
        WIN_COMBINATIONS.detect do |win_indices|
          # win_indices = [6,7,8]
          taken?(win_indices[0]) &&
          @data[:board][win_indices[0]] == @data[:board][win_indices[1]] &&
          @data[:board][win_indices[0]] == @data[:board][win_indices[2]]
        end
    end

    def winner
        winning_combo = won?
        if winning_combo
            data[:board][winning_combo[0]]
        end
    end

    def taken?(index)
        @data[:board][index] != " "
    end

    def draw?
        # not a win && all cells are filled
        !won? && @data[:board].none?{|el| el == " "}
    end


    def get_empty_spaces(board)
        board.map.with_index{|el, i| el == " " ? i : nil}.compact
    end

    def other_player
        @data[:turn] == 'X' ? "O" : "X"
    end
end