require 'pry'
class Game

  attr_accessor :board, :player_1, :player_2, :token

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [2,5,8],
    [1,4,7],
    [0,4,8],
    [6,4,2]
  ]


  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
    @token = token
  end

  def current_player
    if board.turn_count.even?
      player_1
    elsif board.turn_count.odd?
      player_2
    end
  end


  def won?
    WIN_COMBINATIONS.each do |combo|
      if board.cells[combo[0]] == board.cells[combo[1]] &&
      board.cells[combo[1]] == board.cells[combo[2]] &&
      (board.cells[combo[0]] == "X" || board.cells[combo[0]] == "O")
      return combo
      end
    end
    false
  end

  def draw?
    !won? && board.full?
  end

  def over?
    won? || draw?
  end

  def winner
    if winning_combo = won?
      board.cells[winning_combo.first]
    end
  end



  def turn
    choice = current_player.move(board)

    if board.valid_move?(choice)

      board.update(choice, current_player)
    else
      puts "Please enter 1-9:"
      turn
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



end
