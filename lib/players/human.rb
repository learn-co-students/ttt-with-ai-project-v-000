module Players
  class Human < Player
    def move(board)
      puts "Make your move: 1-9."
      move_choice = gets.strip
    end
  end
end
