require 'pry'

module Players
	class Computer < Player



	WIN_COMBINATIONS = [
    [0,1,2], # Top row
    [3,4,5],  # Middle row
    [6,7,8],  # bottom row
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [2,4,6],
    [0,4,8] ]

	def move(board)

        #binding.pry

        if board.turn_count == 0
            "5"
        elsif board.turn_count < 4 && board.taken?("1") == false
            "1"
        elsif board.turn_count < 4 && board.taken?("3") == false
            "3"
        elsif board.taken?("6") == false
            "6"
        else

            random_move(board)
            #block_win(board)
    	end
    end


    def random_move(board)
        tmp = board.cells.each_index.select{|i| board.cells[i] == " "}
            tmp.map!{|i| i + 1}.sample.to_s
    end


    def block_win(board)
        WIN_COMBINATIONS.each do |combo|
            if board.cells.combo.include?("X" "X")
                return combo.index(" ")
            end
        end
    end

	end
end
