require 'pry'
module Players
    class Computer < Player
        
        WIN_COMBINATIONS = [
            [0, 1, 2],
            [3, 4, 5],
            [6, 7, 8],
            [0, 3, 6],
            [1, 4, 7],
            [2, 5, 8],
            [0, 4, 8],
            [2, 4, 6]
        ]
        
#        def move(board)
#            valid_indexes = board.cells.each_index.select{|x| board.cells[x] == " "}
#            valid_moves_i = valid_indexes.collect {|x| x + 1}
#            valid_moves = valid_moves_i.collect {|x| x.to_s}
#            valid_moves.sample
#        end
        
        def move(board)
            valid_indexes = board.cells.each_index.select{|x| board.cells[x] == " "}
            indexes_with_x = board.cells.each_index.select{|x| board.cells[x] == "X"}
            indexes_with_o = board.cells.each_index.select{|x| board.cells[x] == "O"}
            random_valid_moves = valid_indexes.collect {|x| x + 1}
            var = nil
            
            if valid_indexes.count == 9 
                var = valid_indexes
            elsif self.token == "X"
                var = indexes_with_o
            elsif self.token == "O"
                var = indexes_with_x
            end
            
            possible_moves = WIN_COMBINATIONS.select {|x| x.include?(var.sample)}
            possible_moves2 = possible_moves.flatten.uniq
            new_array = possible_moves2 - indexes_with_o - indexes_with_x
            valid_moves = new_array.collect {|x| x + 1}
            valid_moves == [] ? random_valid_moves.sample.to_s : valid_moves.sample.to_s 
                
        end
        
    end
end