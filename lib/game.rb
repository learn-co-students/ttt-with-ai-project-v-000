require 'pry'

class Game

  WIN_COMBINATIONS = [[0,1,2],
                      [3,4,5],
                      [6,7,8],
                      [0,3,6],
                      [1,4,7],
                      [2,5,8],
                      [0,4,8],
                      [6,4,2]  ]

  attr_accessor :board, :player_1, :player_2

  def initialize (player_1 = Human.new("X"), player_2 = Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    @board.turn_count % 2 == 0 ? @player_1 : @player_2
  end

  def player_1_wins
    WIN_COMBINATIONS.any? {|combo| @board.cells[combo[0]] == "X" && @board.cells[combo[1]] == "X" && @board.cells[combo[2]] == "X"}
  end

  def player_2_wins
    WIN_COMBINATIONS.any? {|combo| @board.cells[combo[0]] == "O" && @board.cells[combo[1]] == "O" && @board.cells[combo[2]] == "O"}
  end

  def winner
    if won?
      player_1_wins ? "X" : "O"  # "#{@player_1.token}" : "#{@palyer_2.token}"
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
  	@board.display
    if current_player == @player_1
      puts "Player 1, select your move (1-9)!"
    else
      puts "Player 2, Select your move (1-9)!"
    end
    player_move = current_player.move(@board)


    if @board.valid_move?(player_move)
       @board.cells[player_move.to_i - 1] = current_player.token
       @board.display
    else
      turn
    end
  end

  def play
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
