class Game

  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [2,4,6],
    [0,4,8]
  ]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    @board.turn_count % 2 == 0 ? @player_1 : @player_2
  end

  def over?
    if won? || draw? || @board.full?
      true
    else
      false
    end
  end

  def won?
    the_answer = false
    WIN_COMBINATIONS.each do |win_combination| # Scope Gate
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]
      position_1 = @board.cells[win_index_1]
      position_2 = @board.cells[win_index_2]
      position_3 = @board.cells[win_index_3]
      a_win = [position_1, position_2, position_3].uniq.size == 1 && position_1 != " "
      if a_win
        the_answer = win_combination
      end
    end
    the_answer
  end

  def draw?
    if !won? && @board.full?
      return true
    else
      return false
    end
  end

  def winner
    winning_arr = won?
    if winning_arr.class == Array && @board.cells[winning_arr[0]] == "X"
      return "X"
    elsif winning_arr.class == Array && @board.cells[winning_arr[0]] == "O"
      return "O"
    else
      return nil
    end
  end

  def turn
    player = current_player
    their_move = player.move(@board)
    if @board.valid_move?(their_move)
      @board.update(their_move, player)
      @board.display
    else
      turn
    end
  end

  def play
    until over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    else
      puts "Cats Game!"
    end
  end


end
