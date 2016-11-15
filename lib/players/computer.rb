module Players

  class Computer < Player

    def move(board)
      puts "The computer's choice is:"
      if board.cells.empty?
        "8"
      elsif !(board.cells[7].include?("X") || board.cells[7].include?("O"))
        "8"
      elsif !(board.cells[0].include?("X") || board.cells[0].include?("O"))
        "1"
      elsif !(board.cells[2].include?("X") || board.cells[2].include?("O"))
        "3"
      elsif !(board.cells[5].include?("X") || board.cells[5].include?("O"))
        "6"
      elsif !(board.cells[3].include?("X") || board.cells[3].include?("O"))
        "4"
      elsif !(board.cells[4].include?("X") || board.cells[4].include?("O"))
        "5"
      elsif !(board.cells[8].include?("X") || board.cells[8].include?("O"))
        "9"
      elsif !(board.cells[6].include?("X") || board.cells[6].include?("O"))
        "7"
      elsif !(board.cells[1].include?("X") || board.cells[1].include?("O"))
        "2"
      end
    end

  end
end
