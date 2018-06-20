class Game
  attr_accessor :player_1, :player_2, :board
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

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    # accepts 2 players and a board
    # defaults to two human players, X and O, with an empty board
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def cells
    @board.cells
  end

  def turn_count
  count = 0
  cells.each do |play|
    if play == "O" || play == "X"
      count +=1
    end
  end
  count
end

  def current_player
    # returns the correct player, X, for the third move
    if turn_count.even?
      player_1
    else
      player_2
    end
  end

  def won?
    # returns false for a draw
    # returns the correct winning combination in the case of a win
    # isn't hard-coded
    winner = nil
    WIN_COMBINATIONS.each do |combo|
      if combo.all? {|idx| cells[idx] == "X"}
        winner = combo
      elsif combo.all? {|idx| cells[idx] == "O"}
        winner = combo
      else
        false
      end
    end
    if winner != nil
      winner
    else
      false
    end
  end

  def full?
    cells.all? {|token| token == "X" || token == "O"}
  end

  def draw?
    # returns true for a draw
    # returns false for a won game
    # returns false for an in-progress game
    if full? && !(won?)
      true
    else
      false
    end
  end

  def over?
    # returns true for a draw
    # returns true for a won game
    # returns false for an in-progress game
    if draw? || won? || full?
      true
    else
      false
    end
  end
  def winner
    # returns X when X won
    # returns O when O won
    # returns nil when no winner
    WIN_COMBINATIONS.each do |combo|
      if combo.all? {|idx| cells[idx] == "X"}
        return "X"
      elsif combo.all? {|idx| cells[idx] == "O"}
        return "O"
      end
    end
    nil
  end
  def turn
    # makes valid moves
    # asks for input again after a failed validation
    # changes to player 2 after the first turn
    player = current_player
    input = player.move(@board)
    if @board.valid_move?(input)
      @board.update(input, player)
      @board.display
    else
      turn
    end
  end
  def play
    # asks for players input on a turn of the game
    # checks if the game is over after every turn
    # plays the first turn of the game
    # plays the first few turns of the game
    # checks if the game is won after every turn
    # checks if the game is a draw after every turn
    # stops playing if someone has won
    # congratulates the winner X
    # congratulates the winner O
    # stops playing in a draw
    # prints "Cat's Game!" on a draw
    # plays through an entire game

    @board.display
    until over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end
  
end
