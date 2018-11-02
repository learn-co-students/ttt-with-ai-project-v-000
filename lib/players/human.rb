module Players
  class Human < Player
    def move(board)
      puts " "
      puts "==========="
      board.display
      puts "==TURN: #{board.turn_count}=="
      puts " "

      puts "Where do you want to place your token? (1 - 9):"
      input = gets.strip
    end
  end
end
