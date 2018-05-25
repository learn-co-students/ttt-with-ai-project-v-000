module Players
  class Human < Player
    def move(board_obj)
      puts "In which position would you like to place a token?"
      x = gets.strip
      x
    end
  end
end