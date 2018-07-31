module Players

  class Human < Player
    def move(spot)
      # Board.cells[spot.to_i-1] = Player.token
      puts "Pick a space:"
      input = gets.chomp
    end

  end

end
