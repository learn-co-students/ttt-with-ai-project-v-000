require 'pry'

class String
  def black;          "\e[30m#{self}\e[0m" end
  def red;            "\e[31m#{self}\e[0m" end
  def green;          "\e[32m#{self}\e[0m" end
  def brown;          "\e[33m#{self}\e[0m" end
  def blue;           "\e[34m#{self}\e[0m" end
  def magenta;        "\e[35m#{self}\e[0m" end
  def cyan;           "\e[36m#{self}\e[0m" end
  def gray;           "\e[37m#{self}\e[0m" end
end

class Game

  WIN_COMBINATIONS = [[0,1,2],
                      [6,7,8],
                      [0,3,6],
                      [2,5,8],
                      [0,4,8],
                      [6,4,2],
                      [3,4,5],
                      [1,4,7]]

  attr_accessor :board, :player_1, :player_2

  def initialize (player_1 = Human.new("X"), player_2 = Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    board.turn_count % 2 == 0 ? player_1 : player_2
  end

  def player_1_wins
    WIN_COMBINATIONS.any? {|combo| board.cells[combo[0]] == "X" && board.cells[combo[1]] == "X" && board.cells[combo[2]] == "X"}
  end

  def player_2_wins
    WIN_COMBINATIONS.any? {|combo| board.cells[combo[0]] == "O" && board.cells[combo[1]] == "O" && board.cells[combo[2]] == "O"}
  end

  def winner
    if won?
      player_1_wins ? player_1.token : player_2.token
    end
  end

  def won?
    player_1_wins || player_2_wins
  end

  def draw?
    @board.full? && !won?
  end

  def over?
    won? || draw?
  end


  def turn
    if current_player == player_1
      puts "Player 1, select your move (1-9)!".blue
    else
      puts "Player 2, select your move (1-9)!".green
    end
    player_move = current_player.move(@board.cells)
    if board.valid_move?(player_move)
       board.update(player_move, current_player)
       board.display
    else
      puts "Invalid move!  Please select your move again."
      turn
    end
  end

  def play
    board.display
    turn until over?
    if won?
      if winner == "X"
        puts "Congratulations X!"
      elsif winner == "O"
        puts "Congratulations O!"
      end
    elsif draw?
      puts "Cats Game!"
    end
  end

end
# binding.pry
