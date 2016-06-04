class TTTController

  def start
    puts "Welcome to Tic-Tac-Toe. "
    print "How many players (0-2)? "
    num = gets.chomp.to_i
    if num == 0
      p1 = Player::Computer.new("X")
      p2 = Player::Computer.new("O")
      g = Game.new( p1, p2 )
      g.play
    elsif num ==1
      p1 = Player::Human.new("X")
      p2 = Player::Computer.new("O")
      g = Game.new( p1, p2 )
      g.play
    elsif num == 2
      g =Game.new
      g.play
    end

  end

end