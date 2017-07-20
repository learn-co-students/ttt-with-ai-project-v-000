module Players
  class Human < Player
    def move(board)
      # board.display
      puts "Please enter 1-9:"
      gets.chomp
    end
  end
end
# done
