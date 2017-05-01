require 'pry'
class Game
  attr_accessor :board, :player_1, :player_2
  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,4,8],
    [6,4,2],
    [2,5,8],
    [0,3,6],
    [1,4,7]
  ]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O") , board = Board.new)
    @board =  board
    @player_1 = player_1
    @player_2 = player_2
  end

  def current_player
    board.turn_count.even? ? player_1 : player_2
  end

  def won?
     WIN_COMBINATIONS.detect{|win| board.cells[win[0]] ==  board.cells[win[1]] && board.cells[win[1]] ==  board.cells[win[2]] && board.taken?(win[2]+1)}
  end

  def draw?
       board.full? && !won?
  end

  def over?
    draw? || won?
  end

  def winner
    if won = won?
      board.cells[won.first]
    end
    # won? ? board.cells[won?[0]] : nil
  end

  def turn
    a = current_player.move(board)
    if board.valid_move?(a)
      board.update(a,current_player)
    else
      puts "Please enter vaild value."
      turn
    end
  end
  def display_before_play
    puts "Start Tic Tac Toe"
    puts " 1 | 2 | 3 "
    puts "------------"
    puts " 4 | 5 | 6 "
    puts "------------"
    puts " 7 | 8 | 9 "
    puts "============="
  end
  def play
    display_before_play
    until over?
      puts "#{current_player.token}'s turn."
      turn
      board.display
    end
    if won?
      puts "Congratulations #{winner}!"
    else draw?
      puts "Cat's Game!"
    end
  end

end
