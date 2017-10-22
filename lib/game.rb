require 'pry'

class Game

  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6],
                      [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]

  def initialize(player_1 = Players::Human.new('X'), player_2 = Players::Human.new('O'), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    board.turn_count % 2 == 0 ? player_1 : player_2
  end

  def full?
    board.full?
  end

  def over?
    won? || draw? 
  end

  def draw?
    full? && !won?
  end

  def won?
    WIN_COMBINATIONS.detect do |combination|
      p1, p2, p3 = combination[0], combination[1], combination[2]
      board.cells[p1] == board.cells[p2] && board.cells[p2] == board.cells[p3] && board.cells[p1] != " "
    end
  end

  def winner
    combination = won?
    combination ? board.cells[combination[0]] : nil
  end

  def turn
    selection = current_player.move(board)
    if board.valid_move?(selection)
      board.update(selection, current_player)
      board.display
    else
      puts "#{selection} is not a valid move.  Please enter again (1 ~ 9)"
      turn
    end
  end

  def play


    until over?
      puts "\n#{current_player.token}'s turn! Please enter 1-9 (1 is top left and 9 is bottom right)"
      turn
    end

    win = winner
    if win
      puts "\nCongratulations #{winner}!"
    else
      puts "\nCat's Game!"
    end
  end                  
end