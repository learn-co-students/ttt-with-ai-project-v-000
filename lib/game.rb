require 'pry'
class Game
  #basic runtime and logic
  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,4,8],
    [2,4,6],
    [0,3,6],
    [1,4,7],
    [2,5,8]
  ]

   def initialize(player1=Players::Human.new("X"),player2=Players::Human.new("O"),board = Board.new)
    @player_1 = player1
    @player_2 = player2
    @board = board
  end


  def current_player
    #the turn count reports taken squares so on the 3rd turn, it returns 2
    return @player_2 if @board.turn_count.odd?
    return @player_1 if @board.turn_count.even? || @board.turn_count == 0
  end

  def won?
    Game::WIN_COMBINATIONS.each do |win_combination|
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]

      position_1 = @board.cells[win_index_1]
      position_2 = @board.cells[win_index_2]
      position_3 = @board.cells[win_index_3]

      if position_1 == "X" && position_2 == "X" && position_3 == "X"
        return true
      elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
        return true
      else
         false
      end
    end
    return false
  end

  def over?
    if won? == true
      true
    elsif @board.full? == true
      true
    else
      false
    end
  end

  def draw?
    if @board.full? == true && won? == false
      true
    else
      false
    end
  end

  def winner
    if won? == false
      return nil
    else
       winning_array = Game::WIN_COMBINATIONS.detect{|win_array|
        @board.cells[win_array[0]] == @board.cells[win_array[1]] && @board.cells[win_array[2]] == @board.cells[win_array[0]] && @board.cells[win_array[0]] != " "
        }
        @board.cells[winning_array[0]]
    end
  end

  def start
    puts " 1 | 2 | 3 "
    puts "-----------"
    puts " 4 | 5 | 6 "
    puts "-----------"
    puts " 7 | 8 | 9 "
    play
  end

  def play
    until over? == true || won? == true || draw? == true
      turn
    end
    puts "Cat's Game!" if draw? == true
    puts "Congratulations #{winner}!" if won? == true
  end

  def turn
      input = current_player.move(@board)
      if @board.valid_move?(input) == true
        @board.update(input,current_player)
        @board.display
      else
        turn
      end

  end

end