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
    [6,4,2]
  ]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def current_player
    board.turn_count % 2 == 0 ? @player_1 : @player_2
  end

  def won?
    WIN_COMBINATIONS.each do |combo|
      position_1 = @board.cells[combo[0]]
      position_2 = @board.cells[combo[1]]
      position_3 = @board.cells[combo[2]]

      if (position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O")
        @win = [combo[0], combo[1], combo[2]]
        return @win
      end
    end
    false
  end

  def draw?
    if won? == false && @board.full? == true
      true
    else
      false
    end
  end

  def over?
    won? || draw?
  end

  def winner
    if won?
      return @board.cells[won?[1]]
    end
  end

  def turn
    player = current_player
    user_input = player.move(@board)
    if @board.valid_move?(user_input)
      @board.update(user_input, player)
      @board.display
    else
      turn
    end
  end

  def play
    while !over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end

end
