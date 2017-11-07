class Game

  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
  ]

  def initialize(player_1=Players::Human.new("X"),player_2=Players::Human.new("O"),board=Board.new)
    #puts "initialize it"
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def self.message
    puts "class method message"
  end

  def self.start
    puts "Welcome to Tic Tac To"
    print "Enter number of players: (0,1,2) "
    count = gets.strip.to_i
    if count == 0
      puts "Commencing 0 player game, X moves first."
      Game.new(player_1=Players::Computer.new("X"),player_2=Players::Computer.new("O")).play
    elsif count == 1
      print "Would you like to go first? (Y-Human plays X; N-Computer plays X) "
      go_first = gets.strip
      if go_first == "Y"
        player_1 = Players::Human.new("X")
        player_2 = Players::Computer.new("O")
      else
        player_1 = Players::Computer.new("X")
        player_2 = Players::Human.new("O")
      end
      Game.new(player_1,player_2).play
    elsif count == 2
      puts "Commencing 2 player game, X moves first."
      Game.new.play
    else
      puts "Game not available for that player count."
    end
  end

  def current_player
    self.board.turn_count % 2 == 0 ? self.player_1 : self.player_2
  end

  def over?
    if self.board.full? == true || !!self.won? == true || self.draw? == true
      response = true
    else
      response = false
    end
    #binding.pry
    return response
  end

  def won?
    winner = WIN_COMBINATIONS.detect{|combination|
      self.board.cells[combination[0]] == self.board.cells[combination[1]] && self.board.cells[combination[1]] == self.board.cells[combination[2]] && self.board.cells[combination[0]] != " "
    }
    !!winner ? winner : false
  end

  def draw?
    self.board.full? && !self.won?
  end

  def winner
    w = won?
    w ? self.board.cells[w[0]] : nil
  end

  def turn

    #binding.pry
    m = self.current_player.move(self.board)
    m = m.to_i
    while !self.board.valid_move?(m)  do
      #binding.pry
      puts "Invalid board selection."
      m = self.current_player.move(self.board)
    end
    self.board.update(m,self.current_player)
    self.board.display
  end

  def play
    self.board.display
    until self.over? do
      turn
    end
    if self.won?
      puts "Congratulations #{self.winner}!"
    elsif self.draw?
        puts "Cat's Game!"
    end
    #puts "Play again?"
  end

  def self.win_combos
    WIN_COMBINATIONS
  end

end
