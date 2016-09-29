require "pry"

class Game
  attr_accessor :board, :player_1, :player_2

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  WIN_COMBINATIONS = [
    [0,1,2], #Top Row
    [3,4,5], #Middle Row
    [6,7,8], #Bottom Row
    [0,3,6], #Left Column
    [1,4,7], #Middle Column
    [2,5,8], #Right Column
    [0,4,8], #Diagonal from top right
    [6,4,2]  #Diagonal from top left
    ]

    def current_player
      board.turn_count.even? ? @player_1 : @player_2
    end

    def won?
      WIN_COMBINATIONS.detect do |combo|
        board.position(combo[0] + 1) == board.position(combo[1] + 1) &&
        board.position(combo[1] + 1) == board.position(combo[2] + 1) &&
        board.taken?(combo[0] + 1)
      end
    end

    def over?
      won? || draw?
    end

    def draw?
      board.full? && !won?
    end

    def winner
      if won?
        @board.cells[won?[0]]
      end
    end

    def turn
      cell = current_player.move(board)
      if board.valid_move?(cell)
        board.update(cell, current_player)
      else
        puts ""
        if current_player.is_a?(Players::Human)
          puts "Invalid move. Try again, #{current_player.token}!"
        else
          puts "(Invalid entry)"
        end
        turn
      end
    end

    def play
      puts
      board.display

      until over?
        turn
        puts
        board.display
      end

      if won?
        puts
        puts "Congratulations, #{winner}!"
        puts
        puts "You've won the game!"
        puts
      elsif draw?
        puts
        puts "Cat's Game! Draw! No winner!"
        puts
      end
    end

end
