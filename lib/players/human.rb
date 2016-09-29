module Players
  class Human < Player

    def move(board)
      puts
      puts "#{token}, please enter a valid move for positions 1-9:"
      puts
      cell = gets.strip
      cell
    end



  end
end
