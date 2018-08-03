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

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"),board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def current_player
    @board.turn_count.to_i.even? == true ? @player_1 : @player_2
  end
  
  def won?
    
    WIN_COMBINATIONS.each do |win_combo|
      index_0 = win_combo[0]
      index_1 = win_combo[1]
      index_2 = win_combo[2]

      position_1 = @board.cells[index_0]
      position_2 = @board.cells[index_1]
      position_3 = @board.cells[index_2]
    
    
      if position_1 == "X" && position_2 == "X" && position_3 == "X"
        return win_combo
      elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
        return win_combo
      end
      
      
    end 
      return false
  end

  def draw?
    if !won? && board.full?
      return true
    else
      return false
    end
  end
  
  def over?
    if won? || board.full? || draw?
      return true
    else
      return false
    end
  end

 def winner
   # if a win combination = won?
   #  @winner = @board.cells[winning piece]
   if self.won?
      self.board.cells[self.won?[0]]
    end
  end
  
  def turn
    
    user_input = current_player.move(board).to_i    
    
    if board.valid_move?(user_input)
        board.update(user_input, current_player)
        self.board.display
    else 
      puts "That space on the board is not valid. Please choose a number 1-9:"
      turn #recursive
    end
  end

  def play
    
    until over? == true
      turn
    end

    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end

end