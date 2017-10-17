require 'pry'
class Game

  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
  ]

  def board
    @board
  end

  def player_1
    @player_1
  end

  def player_2
    @player_2
  end

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    count = 0
    board.cells.each do |element|
      if element != " "
        count += 1
      end
    end
    if count % 2 == 0
      player_1
    else
      player_2
    end
  end

  def over?
    draw? || won?
  end

  def won?
    WIN_COMBINATIONS.detect do |win_combination|
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]

      position_1 = board.cells[win_index_1] # load the value of the board at win_index_1
      position_2 = board.cells[win_index_2] # load the value of the board at win_index_2
      position_3 = board.cells[win_index_3] # load the value of the board at win_index_3

      if position_1 == "X" && position_2 == "X" && position_3 == "X"
        x_wins = win_combination # return the win_combination indexes that won.
      elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
        o_wins = win_combination # return the win_combination indexes that won.
      end
    end
  end

  def draw?
    board.full? && !won?
  end

    def winner
      if self.won?
        board.cells[won?[0]]
      end
    end

  def turn
    player_move = current_player.move(board)
    if board.valid_move?(player_move)
      board.update(player_move, current_player)
      board.display
      puts "  "
      puts "   * * * "
      puts "  "
    else
      turn
    end
  end

  def play
    board.display
    while !over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
      board.display
    elsif draw?
      puts "Cat's Game!"
    end
    play_again?
  end

  def play_again?
     puts "Play again? Y/N"
     input = gets.strip.downcase
     if input == "y" || input == "yes"
       system "ruby bin/tictactoe"
     else
       puts "G O O D B Y E !"
     end
   end

end
