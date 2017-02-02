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

  @@all = {"X"=>0, "O"=>0, "Senseless Destruction"=>0}

  def initialize(player_1=Players::Human.new("X"), player_2=Players::Human.new("O"), board=Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
    puts "\nSweet. When it's your turn, enter a number 1 through 9 to place your token \non the corrosponding spot of the board, '1' being the top left corner and '9' being the bottom right.\n\n"
  end

  def current_player
    if self.board.turn_count.even?
      self.player_1
    else
      self.player_2
    end
  end

  def over?
    draw? || won?
  end

  def draw?
    self.board.full? && !won?
  end

  def won?
    cells = self.board.cells
    WIN_COMBINATIONS.find do |combo|
      self.board.taken?(combo[0]+1) && cells[combo[0]] == cells[combo[1]] && cells[combo[0]] == cells[combo[2]]
    end
  end

  def winner
    won? ? self.board.cells[won?[0]] : nil
  end

  def turn
    puts "Game status:\n"
    self.board.display
    move = current_player.move(self.board)
    if !self.board.valid_move?(move)
      puts "Sorry, that's not a valid move"
      turn
    else
      self.board.update(move, current_player)
    end
  end

  def play
    until over? do
      turn
    end
    if won?
      puts "**GAME OVER**"
      self.board.display
      puts "Congratulations #{winner}!"
      self.class.update(winner.to_s)
      self.class.display
    else
      puts "Cat's Game!"
      self.class.update("Senseless Destruction")
      self.class.display
    end
  end

  def self.update(winner)
    @@all[winner]+=1
  end

  def self.display
    @@all.each do |k, v|
      puts "-#{k} has won #{v} times."
    end
  end

end
