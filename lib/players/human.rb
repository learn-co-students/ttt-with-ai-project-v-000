module Players

  class Human < Player

    def move(token)
      puts "    player move method"
      puts "ENTER A MOVE, PLAYER #{token}:"
      a = gets.chomp
      puts "    just got input '#{a}' from player"
      a
    end
  end

end
