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
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player 
    if @board.turn_count.even? == true 
      @player_1
    else 
      @player_2
    end 
  end
  
  def won?
    WIN_COMBINATIONS.find do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]
    
    position_1 = board.cells[win_index_1] 
    position_2 = board.cells[win_index_2]
    position_3 = board.cells[win_index_3]
      if @player_1 == 5 && @player_2 == 5
        false 
      elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
        return win_combination
      elsif position_1 == "X" && position_2 == "X" && position_3 == "X"
        return win_combination
      else
        false
      end
    end
  end 
  
  def draw?
    board.full? && !won?
  end
  
  def over? 
    won? || draw?
  end 
  
  def winner 
  winning_combo = won?
    if winning_combo 
      board.cells[winning_combo[0]]
    end
  end 
  
  def turn 
    
    if board.valid_move?(index)
      update(input, player)
      board.display
    else 
      turn
    end
  end
end 