module Players
  class Human < Player
    def move(board)
      board.display
      puts "choose input between 1 - 9:"
      input = gets
      input
    end
  end
end
