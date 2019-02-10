module Players
  class Human < Player
    def move(board)
      puts "Where would you like to move? Choose a position numbered 1-9."

      move_pos = gets
      move_pos
    end
  end
end
