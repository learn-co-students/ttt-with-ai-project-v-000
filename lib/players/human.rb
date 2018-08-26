module Players
  class Human < Player
    def move(board)
      puts "Which position do you want to mark?"
      input = gets.strip
    end
  end
end