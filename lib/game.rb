class Game
  attr_accessor :board, :player_1, :player_2

WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]]

  def initialize(player_1 = Player::Human.new("X"), player_2 = Player::Human.new("O"), board = Board.new)
    @player_1 = player_1  
    @player_2 = player_2
    @board = board
  end

  def current_player
   board.turn_count.even? ? player_1 : player_2
  end

  def won?
    WIN_COMBINATIONS.each do |win_combination|
    position_1 = board[win_combination[0]]
    position_2 = board[win_combination[1]]
    position_3 = board[win_combination[2]]
      if (position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O")
        return win_combination
      end
    end
    return false
  end

  def draw?
    full? == true && won? == false
  end

  def over?
    won? != false || draw? == true
  end

  def winner
    winning_array = won?
      if winning_array != false
        return board[winning_array.first]
      else
        return nil
      end
  end



end