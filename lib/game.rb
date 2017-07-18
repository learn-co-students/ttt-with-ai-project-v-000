require 'pry'

class Game

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

    attr_accessor :board, :player_1, :player_2

    def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
      @player_1 = player_1
      @player_2 = player_2
      @board = board
    end

    def current_player
      board.turn_count % 2 == 0 ? player_1 : player_2
    end

    def won?
      return false if !board.cells.include?("X") && !board.cells.include?("O")
      WIN_COMBINATIONS.each do
      |win_combination| win_combination.each do
        win_index_1 = win_combination[0]
        win_index_2 = win_combination[1]
        win_index_3 = win_combination[2]

        position_1 = board.cells[win_index_1]
        position_2 = board.cells[win_index_2]
        position_3 = board.cells[win_index_3]

          if (position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O")
            return win_combination
          end
        end
      end
      false
    end

    def full?
      !board.cells.include?(" ")
    end

    def draw?
      !won? && full?
    end

    def over?
      won? || draw?
    end

    def winner
      return nil if won? == false
      if board.cells[(won?[0])] == "X"
        return "X"
      elsif board.cells[(won?[0])]  == "O"
        return "O"
      end
    end

    def turn
      player = current_player
      index = player.move(@board)
      if !@board.valid_move?(index)
        turn
      else
        @board.update(index, player)
      end
    end

    def play
      until over?
        turn
        @board.display
      end
      if winner == "X"
        puts "Congratulations X!"
      elsif winner == "O"
        puts "Congratulations O!"
      else
        puts "Cat's Game!"
      end
    end

end
