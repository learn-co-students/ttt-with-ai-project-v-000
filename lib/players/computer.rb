module Players
  class Computer < Player
    def move(board)
      "#{1 + Random.rand(9)}"
      #if turn_count == 1
        #{}"5"
      #else
        #{}"#{1 + Random.rand(9)}"
      #end
    end
  end
end





        #if board.cells[combo[0]] == board.cells[combo[1]] && board.taken?(combo[0] + 1)
          #move = board.cells[combo[2]]
        #elsif board.cells[combo[0]] == board.cells[combo[2]] && board.taken?(combo[0] + 1)
        #  move = board.cells[combo[1]]
        #elsif board.cells[combo[1]] == board.cells[combo[2]] && board.taken?(combo[1] + 1)
        #  move = board.cells[combo[0]]
        #else
        #  move = "1-9".sample
