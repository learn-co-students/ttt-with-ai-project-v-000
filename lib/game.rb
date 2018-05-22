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

  def initialize(player_1 = Players::Human.new("X") , player_2 = Players::Human.new("O"), board = Board.new)
    @board = board 
    @player_1 = player_1
    @player_2 = player_2
    #@board.display
    
  end 
  def current_player 
    @board.turn_count.even? ? @player_1 : @player_2
  end 
  def won?
    WIN_COMBINATIONS.find do |combo| 
      @board.cells[combo[0]] == @board.cells[combo[1]] && @board.cells[combo[1]] == @board.cells[combo[2]] && @board.taken?(combo[0] + 1)
      #binding.pry
    end 
  end
  
  def draw? 
    !self.won? &&  @board.full? ? true : false
  end
  
  def over?
    self.won? || @board.full? ? true : false 
  end 
   
  def winner
    @board.cells[self.won?.first] if self.won?
  end 
  def turn
    choice = current_player.move(board)
    #binding.pry
    if @board.valid_move?(choice)
      @board.update(choice, current_player)
      @board.display
      
    else
      turn
      
    end
  end 
  
  def play 
    while !over? && !won? && !draw?
      turn 
    end 
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end 
  
  def start 
    puts " Welcome to TICTACTOE AI version "
    puts " Please select 1 Player /type 1  , 2 Player/ type 2 or 0 Player / type 0 "
    input = gets.strip

    puts " Player 1 will be assigned X: and Player_2 will be assigned O:"
      
      case input.to_i
        when 1
          Game.new(player_1 = Players::Human.new("X"),player_1 = Players::Computer.new("O"),Board.new)
        when 2 
          Game.new(player_1 = Players::Human.new("X"),player_1 = Players::Human.new("O"),Board.new)
        when 0
          Game.new(player_1 = Players::Computer.new("X"),player_1 = Players::Computer.new("O"),Board.new)
      else
        puts "You just making it up!"
      end
    
    

  end 
end 

