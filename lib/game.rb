class Game
  attr_accessor :board, :player_1, :player_2
  WIN_COMBINATIONS=[
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]]
    
  def initialize(p1=Players::Human.new('X'), p2=Players::Human.new('O'), board=Board.new )
    @board=board
    @player_1 = p1 
    @player_2 = p2 
  end
  
  def current_player 
    self.board.turn_count.odd? ? @player_2 : @player_1
  end
  
  def won?
    WIN_COMBINATIONS.each do |combo|
      if (combo.all? {|n| self.board.cells[n]=='X'}) or (combo.all?{|n| self.board.cells[n]=='O'})
        return combo
      end
    end
  return FALSE
  end

  def draw?
    (!won? && @board.full?) ? TRUE : FALSE
  end

  def over?
    won? || draw?|| @board.full? ? TRUE : FALSE
  end
  
  def winner
    won? ? self.board.cells[won?[0]] : nil
  end

  def turn
    puts "Please enter 1-9:"
    board.display
    i=self.current_player.move(self.board) 
     if self.board.valid_move?(i) 
       self.board.update(i,self.current_player) 
     else 
       puts 'invalid' 
       self.turn 
     end 
  end
  
  def play
    while !over?
      turn
    end
    if draw?
      puts "Cat's Game!"
      board.display
    else
      w=winner
      puts "Congratulations #{w}!"
      board.display
    end
  end

  
  def self.start
    compx=Players::Computer.new('X')
    compo=Players::Computer.new('O')
    humx=Players::Human.new('X')
    humo=Players::Human.new('O')
    b=Board.new

    puts 'Hi tictactoe'
    puts "Enter number of players: (0,1,2) or start 'wargames'"
    x=gets.strip
    x=x.to_i if x!='wargames'
    if x==0
      g=Game.new(compx,compo,b)
      g.play
    elsif x==1
      puts "Who will play first (as X)? 'c'(omputer) or 'h'(uman)?"
      x=gets.strip
      if x=='c'
        g=Game.new(compx,humo,b)
        g.play
      elsif x=='h'
        g=Game.new(humx,compo,b)
        g.play
      else
        puts 'invalid input, exiting'
      end
    elsif x==2
      g=Game.new
      g.play
    elsif x=='wargames'
      count=0
      won=0
      until count==100
        g=Game.new(compx,compo,b)
        g.play
        won+=1 if g.won?
        count+=1
        g.board.reset!
      end
      puts "#{won} games were won!"
    else
      puts 'invalid input, exiting'
    end
    puts "Enter 'y' to play again or any other key to exit."
    x=gets.strip
    if x=='y'
      Game.start
    else
      exit
    end
  end

end

