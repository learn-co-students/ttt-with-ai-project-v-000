require 'pry'
class Game
  attr_accessor :board, :player_1, :player_2
  attr_reader :token

  WIN_COMBINATIONS = [
    [0,1,2], [3,4,5], [6,7,8],
    [0,3,6], [1,4,7], [2,5,8],
    [0,4,8], [2,4,6]
  ]

  def initialize(player_1= Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end
  def current_player
    (@board.turn_count%2 == 0)? @player_1: @player_2
  end
  def over?
    won? || draw?
  end
  def won?
    WIN_COMBINATIONS.find do |win_combination|
      index_0 = win_combination[0]
      index_1 = win_combination[1]
      index_2 = win_combination[2]
        (@board.cells[index_0] == "X" && @board.cells[index_1] == "X" && @board.cells[index_2] == "X") ||
        (@board.cells[index_0] == "O" && @board.cells[index_1] == "O" && @board.cells[index_2] == "O")
      end
    end
  def draw?
    !won? && @board.full?
  end
  def winner
    (won?)? @board.cells[won?[0]]: nil
  end
  def turn
      # binding.pry
      input = current_player.move(@board)
      if @board.valid_move?(input)
        @board.update(input, current_player)
        @board.display
      else
        puts "invalid"
        turn
      end
  end
  def play
    until over?
      turn
    end
      if winner
        puts "Congratulations #{winner}!"
      elsif draw?
        puts "Cat's Game!"
      end
  end
  # def start
    # input = gets.strip
    #   if input == 1
    #     game = Game.new(player_1= Players::Computer.new("X"), player_2 = Players::Computer.new("O"))
    #     game.play
    #   elsif input == 2
    #     puts "Who would you like to go first and be X? For Player 1, type 1. For Player 2, type 2."
    #     player = gets.strip
    #       if player == 1
    #         game = Game.new(player_1= Players::Human.new("X"), player_2 = Players::Computer.new("O"))
    #         game.play
    #       elsif player == 2
    #         game = Game.new(player_1= Players::Computer.new("X"), player_2 = Players::Human.new("O"))
    #         game.play
    #       end
    #   elsif input == 3
    #     puts "Who would you like to go first and be X? For Player 1, type 1. For Player 2, type 2."
    #     player = gets.strip
    #       if player == 1
    #         game = Game.new(player_1= Players::Human.new("X"), player_2 = Players::Human.new("O"))
    #         game.play
    #       elsif player == 2
    #         game = Game.new(player_1= Players::Human.new("O"), player_2 = Players::Human.new("X"))
    #         game.play
    #       end
    #     end
    #   end
end
