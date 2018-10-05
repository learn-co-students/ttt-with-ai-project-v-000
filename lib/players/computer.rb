require_relative "../player.rb"

module Players
  class Computer < Player
    @@corner_move = [1, 3, 7, 9].sample.to_s
    @@edge_move = [2, 4, 6, 8].sample.to_s
    @@center_move = "5"

    def move(board)
      random_move = (1..9).to_a.sample.to_s
      binding.pry

      strategic moves
      if self.token == "X"
        first_player(board)
      else
        second_player(board)
      end
    end

    def self.first_player(board)
      # first player strategic moves
      first_move = "5"
      if board.cells == [" ", "O", " ", " ", "X", " ", " ", " ", " "]
        second_move = [7, 9].sample.to_s
      elsif board.cells == [" ", " ", " ", "O", "X", " ", " ", " ", " "]
        second_move = [3, 9].sample.to_s
      elsif board.cells == [" ", " ", " ", " ", "X", "O", " ", " ", " "]
        second_move = [1, 7].sample.to_s
      elsif board.cells == [" ", " ", " ", " ", "X", " ", " ", "O", " "]
        second_move = [1, 3].sample.to_s
      end
      second_move

      
    end

    def self.second_player(board)
      # second player strategic moves
    end

  end
end