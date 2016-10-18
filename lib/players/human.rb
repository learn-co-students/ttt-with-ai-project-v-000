module Players

  attr_accessor :token

  class Human < Player

    def move(player)
      puts "Player #{player}, enter your next move:"
      move = gets
      move.chomp
    end

  end

end
