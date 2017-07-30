module Players
  class Computer < Player

    WIN_COMBINATIONS = [
      [0,1,2], #top_row_win
      [3,4,5], #middle_row_win
      [6,7,8], #bottom_row_win
      [0,3,6], #column_1_win
      [1,4,7], #column_2_win
      [2,5,8], #column_3_win
      [0,4,8], #diagonal_1_win
      [2,4,6] #diagonal_2_win
    ]

    attr_accessor :board

    def move(board)
      priority_move = block(board)
      if priority_move.nil?
        random = Random.new
        move = random.rand(1..9)
        if board.valid_move?(move)
          move.to_s
        else
          self.move(board)
        end
      else
        priority_move += 1
        priority_move.to_s
      end
    end #end of move

    def block(board)
      opponent = ""
      block = []
      if self.token == "X"
        opponent = "O"
      elsif self.token =="O"
        opponent = "X"
      end

      WIN_COMBINATIONS.each{|combo|
        block_arr = combo_to_tokens(combo, board.cells)
        if block_arr.count(opponent) == 2 && block_arr.count(" ") == 1
          #puts "Need to block #{opponent}"
          block << combo[block_arr.find_index(" ")]
        end
      }
      block[0]
    end # end of block

    def combo_to_tokens(arr, cells)
      #cells = ["O", " ", " ", "O", "X", " ", " ", " ", " "]
      arr.collect {|each| cells[each]}
    end #end of block_helper

  end #end of class
end #end of module
