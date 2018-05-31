module Players
  class Human < Player

    def move(board)
      puts "Please make your selection."
        board.display
        input = gets
        input
      end
    end
    
end
