class Players
  class Computer < Player


    def move(board)
      valid_moves = board.cells.each_with_index.collect do |cell,i|
        cell == " " || cell == ""
      end
      move = rand(9)
      until valid_moves[move]
        move = rand(9)
      end
      move + 1

    end
  end
end
