module Players
  class Human < Player
    def move(board)
      puts "Please enter the number of the space in which"
      puts "you would like to place your token: (1-9)"
      input = gets.strip
    end
  end
end