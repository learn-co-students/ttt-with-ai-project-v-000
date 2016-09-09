module Players
  class Computer < Player
    def move(board)
      # modify with AI
      (1..9).each do |location|
        return "#{location}" if board.cells[location-1] == " "
      end
    end
  end
end
