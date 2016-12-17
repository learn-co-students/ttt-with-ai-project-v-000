require 'pry'

module Players

  class Computer < Player
    attr_accessor :input

    def move(game)
      #self = #<Players::Computer:0x000000011e16c0 @token="O">
      valid_moves = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
      # binding.pry
      if offense_defense(game) != nil
        # binding.pry
        od_array = offense_defense(game)
        @input = od_array.find {|element| game.board.taken?((element+1).to_s) == false}
      elsif center_spot(game)
        @input = center_spot(game)
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

    # def corners_taken?(game)
    #   corners = ["1","3","7","9"]
    #   if !game.board.taken?(corners[0])
    #     corners[0]
    #   elsif !game.board.taken?(corners[1])
    #     corners[1]
    #   elsif !game.board.taken?(corners[2])
    #     corners[2]
    #   elsif !game.board.taken?(corners[3])
    #     corners[3]
    #   else
    #     false
    #   end
    # end

    def offense_defense(game)
      Game::WIN_COMBINATIONS.find do |win_combination|
        new_array = [game.board.cells[win_combination[0]],game.board.cells[win_combination[1]],game.board.cells[win_combination[2]]] #- will return an array of the values of the board
        if new_array.count("X") == 2 && new_array.include?(" ") || new_array.count("O") == 2 && new_array.include?(" ")
          # binding.pry
          new_array.index(" ")
        else
          false
        end
        # binding.pry
      end
    end #def offense_defense

  end
end
