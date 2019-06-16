
class TicTacToeTree < Tree

    WIN_COMBINATIONS = [
        Set.new([0,1,2]),
        Set.new([3,4,5]),
        Set.new([6,7,8]),
        Set.new([0,3,6]),
        Set.new([1,4,7]),
        Set.new([2,5,8]),
        Set.new([0,4,8]),
        Set.new([2,4,6])
    ]
    #for board, 1 = me, 0 = opponent, nil = open
    attr_reader :board, :first#, :opponent_tree

    def initialize(first: true)#, opponent = nil)
        @first = first
        @board = Array.new(9,Type.free)
        super({board: @board, score: nil})
        if !first
          opponent_moves = self.available_moves(@board)

          opponent_moves.each do |move|
            temp_board = []
            @board.each{|i| temp_board << i}
            temp_board[move] = 0
            @root_node.add_child_data({board: temp_board, score: nil})
          end
        end

        construct_tree(true)
        self.assign_minimax_score

    end

    def update_tree(board)
        @board = board
    end

    def construct_tree(mine = true)
        self.df_partial_construct do |h_board_node|
            h_board = h_board_node.data[:board]
            #do nothing if this node is a win or lose node
            next if h_board == Type.lose || h_board == Type.win
            #get available spaces
            available_spaces = available_moves(h_board)
            #construct a new board for each possible move
            for my_move in 0...available_spaces.length
                #copy h_board into a temp array to avoid changing h_board
                temp_board = []
                h_board.each{|i| temp_board << i}
                #get a new possible move
                my_avail_move = available_spaces[my_move]
                #update the temp board array
                temp_board[my_avail_move] = Type.mine
                #if this is a winning move, add Type.win as a child
                if win?(my_spaces(temp_board))
                    h_board_node.add_child_data({board: Type.win, score: 10}, {move: my_avail_move, score: nil})
                else
                    #get the moves they will be left with if you move to this space
                    their_avail_moves = available_spaces.reject{|move| move == my_avail_move}
                    # put a child in for each of their moves after yours
                    their_moves = []
                    their_avail_moves.each do |their_move|
                        #copy the temp board to make all of their possible moves
                        their_temp_board = []
                        temp_board.each{|i| their_temp_board << i}
                        #get their next possilbe move, and evaluate for a loss
                        their_temp_board[their_move] = Type.opponent
                        if win?(opponent_spaces(their_temp_board))
                            # assume the opponent will take the winning move
                            their_moves.clear
                            their_moves << {{move: my_avail_move, score: nil} => {board: Type.lose, score: -10}}
                        else
                            # their_moves << {my_avail_move => their_temp_board}
                            their_moves << {{move: my_avail_move, score: nil} => {board: their_temp_board, score: nil}}
                        end
                    end

                    h_board_node.add_children_and_vector_data(their_moves)
                end
            end
        end
    end

    def get_move(board = @board)
        node = self.find_node_for_board(board)
        scores = get_score(node)
        max_value = -1 * Float::INFINITY
        next_move = nil
        scores.each do |score_hash|
            if score_hash[:overall] >= max_value
                max_value = score_hash[:overall]
                next_move = score_hash[:move]
            end
        end
        next_move
    end

    def win?(spaces)
        win = false
        WIN_COMBINATIONS.each do |win_combo|
            winning_spots = 0
            spaces.each do |space|
                winning_spots += 1 if win_combo.include?(space)
            end
            win = true if winning_spots >= 3
            break if win
            winning_spots = 0
        end
        win
    end

    def get_spaces(board, type)
        spaces = []
        board.each.with_index do |space, i|
            spaces << i if space == type
        end
        spaces
    end

    def my_spaces(board)
        get_spaces(board, Type.mine)
    end

    def opponent_spaces(board)
        get_spaces(board, Type.opponent)
    end

    def available_moves(board)
        available = []
        board.each.with_index do |space, i|
            available << i if space.nil?
        end
        available
    end

    def get_minimax_move(board)
        node = find_node_for_board(board)
        ret_move = nil
        # puts "There are #{node.exiting_vectors.length} exiting vectors"
        max = -1 * Float::INFINITY
        move_vectors = vector_data_hash(node.exiting_vectors)
        move_vectors.each do |move, vec|

            move_scores = []
            vec.each do |v|
                move_scores << v.data[:score]
            end
            move_score = find_min(move_scores)
            # puts "#{move} => #{move_score}"
            if move_score > max
                max = move_score
                ret_move = move
                # puts "New move, max :#{ret_move}, #{max}"
            end
        end
        ret_move
    end

    def get_minimax_score(node)
        max = -1 * Float::INFINITY
        move_vectors = vector_data_hash(node.exiting_vectors)
        move_vectors.each do |move, vec|
            move_scores = []
            vec.each do |v|
                move_scores << v.data[:score]
            end
            move_score = find_min(move_scores)
            if move_score > max
                max = move_score
            end
        end
        max
    end

    def assign_minimax_score(node = self.root_node, my_p = true)

        self.dfs_revisit_if do |node|
            # puts "Entering tree"
            if node.data[:score].nil? && node.exiting_vectors.length > 0 && node.exiting_vectors[0].data.nil?
                # puts "Exit if no vector data (if you are not first)"
                false
                next
            end
            if node.data[:score].nil? && node.exiting_vectors.length > 0 && node.exiting_vectors.any?{|v| v.data[:score].nil?}
                # puts "Skipping node from level #{node.level}"
                true
            else
                # puts "Evaluating node from level #{node.level}"
                if node.data[:score].nil? && node.exiting_vectors.length == 0
                    # puts "Draw, score assigned to #{node.data[:board]} to 0"
                    node.data[:score] = 0
                    if node.entering_vector.data[:score].nil?
                        node.entering_vector.data[:score] = [node.data[:score]]
                    else
                        node.entering_vector.data[:score] << node.data[:score]
                    end
                    # puts "Updated vector score to #{node.entering_vector.data[:score]}"
                elsif node.data[:score].nil? && node.exiting_vectors.length > 0
                    # puts "Evaluating a node whose vectors have been evaluated"
                    # puts "Evaluating #{node.exiting_vectors.length} vector outputs"
                    node.exiting_vectors.each do |v|
                        v.data[:score] = find_min(v.data[:score])
                        # puts "Mapped vector score to #{v.data[:score]} for level #{v.from.level}"
                    end
                    vector_scores = node.exiting_vectors.map{ |v| v.data[:score]}
                    node.data[:score] = get_minimax_score(node)
                    # puts "Assigning node score of #{node.data[:score]}"
                else
                    # puts "End case: win or lose"
                    if node.entering_vector.data[:score].nil?
                        node.entering_vector.data[:score] = [node.data[:score]]
                    else
                        node.entering_vector.data[:score] << node.data[:score]
                    end
                    # puts "Assigned vector score to #{node.entering_vector.data[:score]}"
                end
                # puts "Computed node"
                false
            end
        end

    end

    def find_max(arr)
        max = -1 * Float::INFINITY
        arr.each do |a|
            max = a if a >= max
        end
        max
    end

    def find_min(arr)
        min = Float::INFINITY
        arr.each do |a|
            min = a if a <= min
        end
        min
    end


    def get_score(node = self.root_node)
        return_data = []
        my_moves = vector_data_hash(node.exiting_vectors)
        my_moves.each do |move, vectors|
            wins = 0
            losses = 0
            vectors.each do |vector|
                if vector.to.data == {board: Type.win, score: 10}
                    wins = Float::INFINITY
                    next
                elsif vector.to.data == {board: Type.lose, score: -10}
                    losses = Float::INFINITY
                    next
                end
                self.traverse_descendents_by_generation_from_node(vector.to) do |no|
                    generation_counter = 1
                    no.each do |n|
                        if generation_counter == 1
                            wins += 10 if n.data[:board] == Type.win
                            losses += 10 if n.data[:board] == Type.lose
                            generation_counter += 1
                        else
                            wins += 10 if n.data[:board] == Type.win
                            losses += 10 if n.data[:board] == Type.lose
                            generation_counter += 1
                        end
                    end
                end
            end
            data = {move: move, wins: wins, losses: losses, overall: (wins - losses)}
            return_data << data
            puts "#{data}"
        end
        return_data
    end



    def find_node_for_board(board)
        return_node = nil
        self.dfs_nodes do |node|
            if board == node.data[:board]
                return_node = node
            end
        end
        return_node
    end

    def arr_to_hash(arr)
        hash = {}
        arr.each do |a|
            if !!hash[a]
                hash[a] += 1
            else
                hash[a] = 1
            end
        end
        hash
    end

    def vector_data_hash(vectors)
        hash = {}
        vectors.each do |v|
            if !!hash[v.data[:move]]
                hash[v.data[:move]] << v
            else
                hash[v.data[:move]] = [v]

            end
        end
        hash
    end



    class Type
        def self.mine
            1
        end

        def self.opponent
            0
        end

        def self.free
            nil
        end

        def self.lose
            -1
        end

        def self.win
            2
        end
    end


end
