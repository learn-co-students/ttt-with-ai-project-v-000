class Game
  attr_reader :board, :player_1, :player_2



  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [1,4,7],
    [2,5,8],
    [2,4,6],
    [0,4,8],
    [0,3,6]
  ]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board

  end

  def board=(board)
    @board = board
  end

  def player_1=(player_1)
    @player_1 = player_1
  end

  def player_2=(player_2)
    @player_2 = player_2
  end

  def current_player
    @board.turn_count % 2 == 0 ? player_1 : player_2
  end

  def won?
    WIN_COMBINATIONS.find {
      |combo| @board.taken?("#{combo[0]+1}") &&
      @board.cells[combo[0]] == @board.cells[combo[1]] &&
       @board.cells[combo[1]] == @board.cells[combo[2]]
     }
  end

  def draw?
    if @board.full? && !(won?)
      true
    else
      false
    end
  end

  def over?
    if won? || draw?
      true
    else
      false
    end
  end

  def winner
    if won? && over?
      win_combination = won?
      winner = @board.cells[win_combination[0]]
    else
      nil
    end
  end

  def turn
    input = current_player.move(@board)
    if @board.valid_move?(input) #if valid
      @board.update(input, current_player) # update with input of the current player
      @board.display # display movce
    else
      turn
    end
  end

  def play
    until over?
      turn
    end

    if won?
      puts"Congratulations #{winner}!"
    else
      puts"Cat's Game!"
    end
  end
end
