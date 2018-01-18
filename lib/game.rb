class Game
  attr_accessor :board, :player_1, :player_2
  attr_reader :token

  WIN_COMBINATIONS = [
    [0,1,2], [3,4,5],
    [6,7,8], [0,3,6],
    [1,4,7], [2,5,8],
    [0,4,8], [6,4,2] ]

  def initialize(player_1 = Player::Human.new("X"), player_2 = Player::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def current_player
    board.turn_count.even? ? player_1 : player_2
  end

  def over?
    won? || draw?
  end

  def won?
    WIN_COMBINATIONS.each do |token|
      win_position_1 = token[0]
      win_position_2 = token[1]
      win_position_3 = token[2]

      position_1 = board.cells[win_position_1]
      position_2 = board.cells[win_position_2]
      position_3 = board.cells[win_position_3]

      if position_1 == "X" && position_2 == "X" && position_3 == "X"
        return token
      elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
        return token
      end
    end
    false
  end

  def draw?
    full? && !won?
  end

  def full?
    !board.cells.include?(" ")
  end

  def winner
    if won?
      board.cells[won?[0]]
    end
  end

  def turn
    player_move = current_player.move(board)
    if board.valid_move?(player_move)
      board.update(player_move, current_player)
    else
    turn
    end
  end

  def play
    turn until over?
    if won?
      puts ""
      puts "Congratulations #{winner}!"
    elsif draw?
      puts ""
      puts "Cats Game!"
    end
  end
end
