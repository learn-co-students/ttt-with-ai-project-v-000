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
    if @board.valid_move?(choice)
      @board.update(choice, current_player)
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
    
    
  end 