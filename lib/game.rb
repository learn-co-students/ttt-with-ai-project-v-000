class Game

  WIN_COMBINATIONS = [
    [0, 1, 2], #top row
    [3, 4, 5], #middle row
    [6, 7, 8], #bottom row
    [0, 3, 6], #first column
    [1, 4, 7], #second column
    [2, 5, 8], #third column
    [0, 4, 8], #first diagonal
    [2, 4, 6], #second diagonal
  ]
  
  attr_accessor :board, :player_1, :player_2, :winner

  def initialize(player_1=Human.new("X"), player_2=Human.new("O"), board=Board.new) 
    @player_1 = player_1
    @player_2 = player_2
    @board = board
    @winner = nil
  end

  def current_player
    #if board#turn_count_moves is even, it's player_1. odd, it's player_2 
    @board.turn_count % 2 == 0 ? player_1 : player_2
  end

  def over?
    self.won? || self.draw?
  end

  def won?
    WIN_COMBINATIONS.each do |combination|
      position_1 = @board.cells[combination[0]]
      position_2 = @board.cells[combination[1]]
      position_3 = @board.cells[combination[2]] 

      if ((position_1 == "X" || position_1 == "O") && (position_1 == position_2) && (position_2 == position_3))
        @winner = position_1
        return true
      end
    end
    return false
  end

  def draw? 
    @board.full? && !self.won?
  end

  def winner
    @winner if won? 
  end

  def turn
    if current_player.is_a? Human
      puts "#{current_player.token}, where would you like to move?"
      input = current_player.move(@board)
      while !@board.valid_move?(input) do 
        puts "invalid"
        input = current_player.move(@board)
      end
      @board.update(input, current_player)
    else #computer players
      current_player.move(@board)
    end
  end

  def play
    #game loop
    while !self.over?
      @board.display
      turn
    end
     
    board.display
    if !winner
      puts "Cats Game!"
    else
      puts "Congratulations #{@winner}!"
    end
  end

end
