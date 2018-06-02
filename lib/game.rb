
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
  [2,4,6]
  ]
  
  def initialize(player_1=Players::Human.new("X"), player_2=Players::Human.new("O"), board=Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end
  
  def board
    @board
  end
  
  def current_player
    count = @board.turn_count
    count.even? ? @player_1 : @player_2
  end
    
    
  def won?
    WIN_COMBINATIONS.each do |combo|
    board = @board.cells
      wc = board[combo[0]],board[combo[1]],board[combo[2]]
      
      if wc.all?{|cell| cell == "X"}
        puts combo
        return combo
      elsif wc.all?{|cell| cell == "O"}
        puts combo
        return combo
      end
    end
    return false
  end
  
  
  def draw?
    if (won? == false && @board.full? == true)
      puts "Cat\'s Game!"
      return true
    else
      return false
    end
  end
  
  
  def over?
    won? || draw? ? true : false
  end
  
  
  def winner
  
    if won?
      xs = @board.cells.count("X")
      os = @board.cells.count("O")

      if xs > os
        puts "Congratulations X!"
        winner = "X"
      else
        puts "Congratulations O!"
        winner = "O"
      end
      return winner
    end
    return nil
  end
  
  
  
  def turn 
    puts "Please enter 1-9:"
    input = current_player.move(@board)
    if @board.valid_move?(input)
      @board.update(input,current_player)
      display
    else
      turn
    end
  end
    
  
  def play
    puts "Welcome to Tic Tac Toe!"
    display

    until over? == true
      turn
    end
    winner
    draw?

  end
  
  
  
  

  
  
  
  
  
  
  
end