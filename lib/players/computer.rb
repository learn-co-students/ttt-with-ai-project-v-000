module Players
  class Computer < Player

    def move(board)
      binding.pry
      new_move = (1..9).to_a.sample.to_s

      # new_move = [1,3,7,9].reject {|x| board.taken?(x)}

      board = new_move
    end

    if board.turn_count = 0
        if [0,3,6,8].detect{|x| board.cells[x] == self.token}
    
        end
      end

    **if first**
    start in a corner
  end
end
