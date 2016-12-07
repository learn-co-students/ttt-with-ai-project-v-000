require 'pry'

module Players

  class Computer < Player
    attr_accessor :input

    def move(game)
      #self = #<Players::Computer:0x000000011e16c0 @token="O">
      valid_moves = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
      if center_spot(game)
        @input = center_spot(game)
      elsif corners_taken?(game)
        @input = corners_taken?(game)
      else
      @input = valid_moves.sample
      end
    end

    def center_spot(game)
      if game.board.cells[4] == " "
        "5"
      else
        false
      end
    end

    def corners_taken?(game)
      binding.pry
      corners = ["1","3","7","9"]
      if corners.find {|corner| game.board.taken?(corner) == false; "#{corner}"}
      else
        false
      end
    end

    # Game.WIN_COMBINATIONS

    def offense_defense
      game.WIN_COMBINATIONS.find do |win_combination|
        # binding.pry
        if self.board.cells[win_combination[0]] == "X" && self.board.cells[win_combination[1]] == "X"
          "#{win_combination[2]}"
        elsif self.board.cells[win_combination[0]] == "O" && self.board.cells[win_combination[1]] == "O"
          "#{[win_combination[2]]}"
        else
          return false
        end
      end
    end

  end
end
