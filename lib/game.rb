require 'pry'

class Game
  
  attr_accessor :board, :player_1, :player_2, :cells, :turn_count, :token
  
  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]]
  
  def initialize(player_1=Players::Human.new("X"),player_2=Players::Human.new("O"),board=Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
    @current_player = @player_1
  end
  
  def current_player
    if (self.board.turn_count + 1).odd?
      @player_1
    else
      @player_2
    end
  end
  
  def won?
    WIN_COMBINATIONS.each do |win_combination|
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]
 
      position_1 = self.board.cells[win_index_1] # load the value of the board at win_index_1
      position_2 = self.board.cells[win_index_2] # load the value of the board at win_index_2
      position_3 = self.board.cells[win_index_3] # load the value of the board at win_index_3
    
      if (position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O")
        return win_combination # return the win_combination indexes that won.
      end
    end
    return FALSE
  end
  
  def full?
    self.board.cells.all? { |space| space == "X" || space == "O"}
  end

  def draw?
    if won? == FALSE && full? == TRUE
      return TRUE
    else
      return FALSE
    end
  end
  
  def over?
    if won? != FALSE || full? == TRUE || draw? == TRUE
      return TRUE
    end
  end
  
  def winner
    if won? != FALSE
      index = won?
      if self.board.cells[index[0]] == "X" || self.board.cells[index[0]] == "O"
        return self.board.cells[index[0]]
      end
    end
  end
  
  def turn
    if (1..9).to_a.include?(@current_player.move(self.board).to_i)
    else
      "invalid"
      @current_player.move(self.board).to_i
    end
    self.board.cells[@current_player.user_input.to_i - 1] = @current_player.token
    if @current_player === @player_1
      @current_player = @player_2
    else
      @current_player = @player_1
    end
  end
  
  def play
    until over? == TRUE
      puts "Please enter a number between 1 and 9 that corresponds to an open space on the board."
      @current_player.move(self.board)
      turn
      puts "#{@board.cells}"
      if winner == "X"
        puts "Congratulations X!"
      elsif winner == "O"
        puts "Congratulations O!"
      elsif draw? == TRUE
        puts "Cat's Game!"
      end
    end
    if winner == "X"
      puts "Congratulations X!"
    elsif winner == "O"
      puts "Congratulations O!"
    elsif draw? == TRUE
      puts "Cat's Game!"
    end
  end
  
  def self.start(input1, input2)
    if input1 === "2" && input2 === '1'
      Game.new(player_1,player_2,board)
    elsif input1 === "2" && input2 === '2'
      Game.new(Players::Human.new("O"),Players::Human.new("X"),Board.new)
    elsif input1 === "1" && input2 === "1"
      Game.new(player_1,Players::Computer.new("O"),board)
    elsif input1 === "1" && input2 === "2"
      Game.new(Players::Computer.new("X"),player_2,board)
    elsif input1 === "0" && input2 === "1"
      Game.new(Players::Computer.new("X"),Players::Computer.new("O"),board)
    else
      Game.new(Players::Computer.new("O"),Players::Computer.new("X"),board)
    end
  end
  
end