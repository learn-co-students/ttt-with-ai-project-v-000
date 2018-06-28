require 'pry'
class Game
  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [
    [0,1,2], #Top row
    [3,4,5], #Middle row
    [6,7,8], #Bottom row
    [0,3,6], #Left column
    [1,4,7], #Middle column
    [2,5,8], #Right column
    [0,4,8], #Diagonal downward right
    [2,4,6] #Diagonal downward left
  ]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def current_player
    board.turn_count % 2 == 0 ? player_1 : player_2
  end

  def over?
    won? || draw?
  end

  def won?
      WIN_COMBINATIONS.each do |combination|
        @index1 = combination[0]
        @index2 = combination[1]
        @index3 = combination[2]
        @position_1 = self.board.cells[@index1]
        @position_2 = self.board.cells[@index2]
        @position_3 = self.board.cells[@index3]
        if @position_1 == "X" && @position_2 == "X" && @position_3 == "X"
          return combination # return the win_combination indexes that won.
        elsif @position_1 == "O" && @position_2 == "O" && @position_3 == "O"
          return combination
        end
      end
      false
  end

  def draw?
    self.board.full? && !won?
  end

  def full?
      if board.cells[0] == " "
        false
      elsif board.cells[1] == " "
        false
      elsif board.cells[2] == " "
        false
      elsif board.cells[3] == " "
        false
      elsif board.cells[4] == " "
        false
      elsif board.cells[5] == " "
        false
      elsif board.cells[6] == " "
        false
      elsif board.cells[7] == " "
        false
      elsif board.cells[8] == " "
        false
      else
        true
      end
  end


  def draw?
    !won? && full?
   end

  def over?
    if draw?
      return true
    elsif won? && full?
      return true
    elsif won? && !full?
      return true
    else
      return false
    end
  end

  def winner
     won?
     if won?
      (won?).each do |position|
        @position = position
        board.cells[@position]
        if board.cells[@position] == "X"
          return "X"
        elsif self.board.cells[@position] == "O"
          return "O"
        end
      end
    else
      nil
    end
  end



  def turn
    puts "Please enter 1-9:"
    input = current_player.move(board) #gets an input
    position = (input.to_i - 1)

    if board.valid_move?(input)
      board.update(position.to_s,current_player)
    position = board.position(input)
    if board.valid_move?(input)
      #^THIS WORKS WITHOUT CALLING
      board.update(position,current_player)
      board.display
    else
      turn
    end
  end

  def turn_count
  board.cells.count{|token| token == "X" || token == "O"}
  end

  def play
    binding.pry
    until over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end

end
