module Players
  class Computer < Player
    WIN_COMBINATIONS = [
      #horizontal
      [0,1,2],
      [3,4,5],
      [6,7,8],
      #vertical
      [0,3,6],
      [1,4,7],
      [2,5,8],
      #diagonal
      [0,4,8],
      [2,4,6]
    ]

    def move(board)
      sleep(2)
      o_pos = []
      result = nil
      board.cells.each_index {|index| if board.cells[index] == "0"
                                        o_pos << index
                                      end}
      if o_pos != []
        WIN_COMBINATIONS.each do |combo|
          combo.each do |index|
            if o_pos.include?(index)
              result = combo.sample
              if board.taken?(result)
                move
              end
            end
          end
        end
      end
      if o_pos == []
        input = rand(1..9)
        if board.taken?(input)
          move(board)
        else
          input
        end
      end
    end
  end # end class
end # end module
