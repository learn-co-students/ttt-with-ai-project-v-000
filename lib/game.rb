class Game

  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [[0, 1, 2],[3, 4, 5],[6, 7, 8],[0, 4, 8],[2, 4, 6],[0, 3, 6],[1, 4, 7], [2, 5, 8]]

  def initialize(player_1=Player::Human.new("X"), player_2=Player::Human.new("O"), board=Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    board.turn_count % 2 == 0 ? @player_1 : @player_2
  end

  def over? 
    if 
      won?
        true 
    elsif
      board.full?
        true
    else
        false
    end
      
  end

  def won?
    if WIN_COMBINATIONS.detect {|combo| (board.cells[combo[0]] == "X" && board.cells[combo[1]] == "X" && board.cells[combo[2]] == "X") || (board.cells[combo[0]] == "O" && board.cells[combo[1]] == "O" && board.cells[combo[2]] == "O")}
      true
    else
      false
    end
  end

  def draw?
    !won? && board.full?
  end

  def winner
    if won? &&  WIN_COMBINATIONS.detect {|combo| (board.cells[combo[0]] == "X" && board.cells[combo[1]] == "X" && board.cells[combo[2]] == "X")}
      "X"
    elsif won? && WIN_COMBINATIONS.detect {|combo| (board.cells[combo[0]] == "O" && board.cells[combo[1]] == "O" && board.cells[combo[2]] == "O")}
      "O"
    elsif draw?
      nil
    end
  end

  def turn
    this_turn = current_player.move(@board)
    until @board.valid_move?(this_turn.to_i) 
      turn
    end
      @board.update(this_turn, current_player)
      @board.display
    end
  end


  def play
    while !over?
      turn
    end
    if won?
      "good job"
    elsif draw?
      "Cats Game!"
    end
  end


end