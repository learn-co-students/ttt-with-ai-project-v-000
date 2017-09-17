module Players
  class Computer < Player

    def move(board)
      case
      when board.cells.all? {|cell| cell == " "}
        "4"
      end

    end


  end
end
