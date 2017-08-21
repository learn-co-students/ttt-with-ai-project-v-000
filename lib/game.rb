require 'pry'
class Game
  attr_accessor :board, :player_1, :player_2

    WIN_COMBINATIONS= [
    [0,1,2], #top row
    [3,4,5], #middle row
    [6,7,8], #bottom row
    [0,3,6], #1st col
    [1,4,7], #2nd col
    [2,5,8], #3rd col
    [0,4,8], #left diagonals
    [2,4,6], #right diagonals
  ]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board  = board
  end

  def play
    
    until over?
      self.turn
    end
    
    if won?
      puts "Congratulations #{winner}!"
    else
      puts "Cat's Game!"
    end

  end

  def turn
    puts "Please enter 1-9:"
    input = self.current_player.move(@board)
    if board.valid_move?(input)
      board.update(input,self.current_player)
    else
      puts "Please try again"
      self.turn
    end
    board.display
  end

  def current_player
    board.turn_count % 2 == 0 ? player_1 : player_2
  end

  def won?
    WIN_COMBINATIONS.select do |combination|
      win_index_1 = combination[0]
      win_index_2 = combination[1]
      win_index_3 = combination[2]

      position_1 = board.cells[win_index_1]
      position_2 = board.cells[win_index_2]
      position_3 = board.cells[win_index_3]

        if (position_1 == "X" && position_2 == "X" && position_3 == "X") ||
           (position_1 == "O" && position_2 == "O" && position_3 == "O")
          return combination
        end
      end
      return false
  end

  def draw?
    !won? && board.full?
  end

  def over?
    won? || draw?
  end

  def winner
    win_combination = won?
    if won?
      board.cells[win_combination[0]]
    end
  end

end #end of class