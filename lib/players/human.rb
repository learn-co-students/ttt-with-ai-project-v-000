module Players
  class Human < Player
    def move(board)
      puts "Please enter 1-9:".colorize(:yellow)
      puts "-----------------".colorize(:yellow)
      gets.chomp
    end
  end
end
