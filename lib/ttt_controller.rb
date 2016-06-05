class TTTController

  def start
    puts "Welcome to Tic-Tac-Toe. "
    print "How many players (0-2)? "
    num = gets.chomp
    if num.length > 1
      goofed
    end
    num = num.to_i
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
    else
     goofed
    end
  end

  def goofed
    puts "Ya goofed up the input. Numbers. 0-2. Try again. I know you can do it."
    puts ""
    puts ""
    start
  end

end