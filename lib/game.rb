class Game

  attr_accessor :board, :player_1, :player_2, :winner
  WIN_COMBINATIONS = [
    [0,1,2],[3,4,5],[6,7,8],
    [0,3,6],[1,4,7],[2,5,8],
    [0,4,8],[6,4,2]
  ]


  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    board.turn_count.even? ? player_1 : player_2
  end

  def won?
    WIN_COMBINATIONS.each do |combo|
      if @board.cells[combo[0]] == @board.cells[combo[1]] &&
         @board.cells[combo[1]] == @board.cells[combo[2]] &&
         @board.taken?(combo[0])
        return combo
      end
    end
    return false
  end

  def draw?
    !won? && @board.full? ? true : false
    #If not won and board is full then true, else false
  end

  def over?
    won? || draw? ? true : false
    #if game is won, game is over true
    #if draw is true, game is over is true
  end

  def winner
    if won?
      combo = won?
      @board.cells[combo.first]
    end
  end

  def turn
    #makes valid moves/Changes to player 2 after first turn
    puts "Please enter 1-9:"
    user_input = current_player.move(@board)
    if @board.valid_move?(user_input)
      @board.update(user_input, current_player)
    # Asks for input again after a failed validation
    else puts "Please enter 1-9:"
      turn
    end
    @board.display
  end

    # asks for players input on a turn of the game
    #checks if the game is over after every turn


  # def play
  #   turn until over?
  #   if won?
  #     puts "Congratulations #{winner}!"
  #   else
  #     puts "Cat's Game!"
  #   end
  # end

  def play
    turn until over?
    puts winner ? "Congratulations #{winner}!" : "Cat's Game!"
  end

end
