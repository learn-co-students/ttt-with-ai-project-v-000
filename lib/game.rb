require 'pry'
class Game
    attr_accessor :player_1, :player_2, :board, :token
      #attr_reader :player_1, :player_2,

  def initialize (player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new )
    @player_1 = player_1
    @player_2 = player_2
    @board = board

  end



  WIN_COMBINATIONS = [
    [0,1,2], #top_row_win
    [3,4,5], #middle_row_win
    [6,7,8], #bottom_row_win
    [0,3,6], #first_column_win
    [1,4,7], #second_column_win
    [2,5,8], #last_column_win
    [0,4,8], #down_diagonal_win
    [2,4,6] #up_diagonal_win
  ]

  def current_player
    if board.cells.count {|value| value == "X" || value == "O"}.odd?
      player_2
    else
      player_1
    end
  end

  def full?
    board.cells.all? {|value| value == "X" || value == "O"}
  end

  def draw?
    full? && !won?
  end

  def over?
    won? || draw?
  end


  def won?
    WIN_COMBINATIONS.detect do |win_combo|
      board.cells[win_combo[0]] == board.cells[win_combo[1]] &&
      board.cells[win_combo[1]] == board.cells[win_combo[2]] &&
      position_taken?(win_combo[0])
    end
  end

  def position_taken?(index)
    @board.cells[index] != " "
  end

  def winner
    if win_combo = won?
      @board.cells[win_combo.first]
    end
  end

  def play
    while !over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end

  def turn
    input = current_player.move(board)
    #binding.pry
    if board.valid_move?(input) == true
      board.update(input, current_player)
      sleep 1
      board.display
    else
      "The move is invalid"
      turn
    end
  end




end
