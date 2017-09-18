class Game

  attr_accessor :player_1, :player_2, :board

  WIN_COMBINATIONS = [
   [0,1,2], # Top row
   [3,4,5], # Middle row
   [6,7,8], # Bottom row
   [0,4,8], # Diagonal Down Left To Right
   [2,4,6], # Diagonal Down Right To Left
   [0,3,6], # First Column
   [1,4,7], # Second Column
   [2,5,8], # Third Column
 ]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    @board.turn_count % 2 == 0 ?   @player_1 : @player_2
  end

  def over?
    true if draw? || won? || @board.full?
  end

  def won?
    WIN_COMBINATIONS.each do |option|
      if @board.cells[option[0]] == "X" && @board.cells[option[1]] == "X" && @board.cells[option[2]] == "X"
        true
        winner

        return option
      elsif
        @board.cells[option[0]] == "O" && @board.cells[option[1]] == "O" && @board.cells[option[2]] == "O"
        true
        winner
        return option
      end
    end
  false
  end

  def draw?
    (@board.full? && !won?) ? true : false
  end

  def winner
    WIN_COMBINATIONS.each do |option|
       if @board.cells[option[0]] == "X" && @board.cells[option[1]] == "X" && @board.cells[option[2]] == "X"
           return "X"
       elsif
         @board.cells[option[0]] == "O" && @board.cells[option[1]] == "O" && @board.cells[option[2]] == "O"
           return "O"
       end
    end
  return nil
  end


  def turn
    puts "Please enter 1-9:"
    # input = gets.strip
    # index = input_to_index(input)
    #   if @board.valid_move?(index)
    #     @board.update(index, current_player)
    #   else
    #     turn
    #   end
  end

  def play
    # while !over?
    #  turn
    # end
    i = 0
    while i<9
      turn
      i+=1
    end

    if winner == "X"
      puts "Congratulations X!"
    elsif winner == "O"
      puts "Congratulations O!"
    end

    if draw?
      puts "Cat's Game!"
    end

  end
end
