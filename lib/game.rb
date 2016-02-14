class Game

  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS =
  [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2],
  ]

  def initialize(player_1 = Player::Human.new("X") , player_2 = Player::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def current_player
    board.turn_count % 2 == 0 ?  @player_1 : @player_2
  end

  def won?
    Game::WIN_COMBINATIONS.each do |win_combo|

      win_index_0 = win_combo[0]
      win_index_1 = win_combo[1]
      win_index_2 = win_combo[2]
      val_position_0 = @board.cells[win_index_0]
      val_position_1 = @board.cells[win_index_1]
      val_position_2 = @board.cells[win_index_2]

      if (val_position_0 == @player_1.token && val_position_1 == @player_1.token && val_position_2 == @player_1.token) or (val_position_0 == @player_2.token && val_position_1 == @player_2.token && val_position_2 == @player_2.token)
        return win_combo
      end
    end
    return false
  end

  def winner
    @board.cells[won?[0]] if over? && won?
  end

  def draw?
    !won? && board.full?
  end

  def over?
    won? || draw?
  end

  def turn
    current_move = current_player.move(@board)
    if !@board.valid_move?(current_move)
      turn
    else
      if current_player.class.to_s == "Player::Computer"
        puts "Computer Player #{current_player.token} Moved!"
      end
      @board.update(current_move, current_player)
      @board.display
    end
  end

  def play
    while !over?
      turn
    end
    if won? 
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cats Game!"
    end
  end

end