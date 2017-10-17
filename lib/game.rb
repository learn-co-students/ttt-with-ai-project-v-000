class Game
attr_accessor :player_1, :player_2, :board

  WIN_COMBINATIONS = [
    [0, 1, 2], #top row
    [3, 4, 5], #middle row
    [6, 7, 8], #bottom row
    [0, 3, 6], #left columns
    [1, 4, 7], #middle columns
    [2, 5, 8], #right columns
    [0, 4, 8], #diagonal 1
    [2, 4, 6] #diagonal 2
  ]

  def start_game
    puts "Welcome to Tic Tac Toe!
    How many players? Please enter 0, 1 or 2."
    players = gets.strip.to_i
    if players == 0
      game = Game.new(player_1 = Players::Computer.new("X"),player_2 = Players::Computer.new("O"))
    elsif players == 1
      game = Game.new(player_1 = Players::Human.new("X"),player_2 = Players::Computer.new("O"))
    elsif players == 2
      game = Game.new
    else
      start_game
    end
    until game.won?
      game.play
    end
  end

  def initialize (player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board=Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    if @board.turn_count % 2 == 0
      @player_1
    else
      @player_2
    end
  end

  def won?
    WIN_COMBINATIONS.find do |combo|
      @board.cells[combo[0]] == @board.cells[combo[1]] &&
      @board.cells[combo[1]] == @board.cells[combo[2]] &&
      @board.taken?(combo[0]+1)
    end
  end

  def draw?
    if !self.won? && @board.full?
        return true
    else return false
    end
  end

  def over?
    if self.won? ||
      self.draw? ||
      @board.full?
      return true
    else return false
    end
  end

  def winner
    if self.won?
      @board.cells[self.won?[0]]
    else
    end
  end

  def turn
    player = current_player
    current_move = player.move(@board)
    if @board.valid_move?(current_move)
      @board.update(current_move, player)
      @board.display
      puts "next move:"
    else
      turn
    end
  end

  def play
    while !self.over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    else draw?
      puts "Cat's Game!"
    end
  end

end
