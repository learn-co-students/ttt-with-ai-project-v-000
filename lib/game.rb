require 'pry'

class Game

  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,4,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [6,4,2]
  ]

  def initialize(player_1=Players::Human.new("X"), player_2=Players::Human.new("O"), board=Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    if @board.turn_count % 2 == 0
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

      #gets the value from board with index equal to winning combination
      @position_1 = @board.cells[win_index_1]
      @position_2 = @board.cells[win_index_2]
      @position_3 = @board.cells[win_index_3]

      if @position_1 == "X" && @position_2 == "X" && @position_3 == "X"
        return win_combination
      else
        false
      end

      if @position_1 == "O" && @position_2 == "O" && @position_3 == "O"
        return win_combination
      else
        false
      end
    end
    false
  end

  def draw?
    !won? && @board.full?
  end

  def over?
    won? || draw? || @board.full?
  end

  def winner
      if won? == false
        nil
      else
        @position_1
      end
  end

  def turn
    #current_player.move(@board)
    move = current_player.move(@board)
    if @board.valid_move?(move)
      move
    else
      turn
    end
    @board.update(move,current_player)
    @board.display
  end

  def play
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

#learn spec/04_game_spec.rb
