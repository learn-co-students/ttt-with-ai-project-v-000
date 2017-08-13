module Players
  class Computer < Player
    def move(board)
      # empty_cells = get_empty_cells(board)
      move_position = optimal_move(board)
      move_position
    end

      # def get_empty_cells(board)
      #   empty_cells = []
      #   board.cells.each_with_index do |cell, index|
      #     if cell == " "
      #       empty_cells[index] = "#{index + 1}"
      #     end
      #   end
      #   empty_cells
      # end

      def optimal_move(board) # [0, 1, 2, 3, 4, 5, 6, 7, 8]
        Game::WIN_COMBINATIONS.each_with_index do |combination, index|
            if empty_board?(board)
              return random_cell
            elsif two_rule?(board, combination)
              move = two_rule?(board, combination)
              return "#{move + 1}"
            else
              binding.pry
              return available_space(board)
            end
          end
        end

      def empty_board?(marked_board)
        if marked_board.cells.include?("X")
          return false
        elsif marked_board.cells.include?("O")
          return false
        end
        true
      end

      def random_cell
        cell = rand(1..9)
        "#{cell}"
      end

      def two_rule?(board, combination)
        first_token = board.cells[combination[0]]
        second_token = board.cells[combination[1]]
        third_token = board.cells[combination[2]]

        if first_token == "X" && second_token == "X"
          return combination[2]
        elsif second_token == "X" && third_token == "X"
          return combination[0]
        elsif first_token == "X" && third_token == "X"
          return combination[1]
        elsif first_token == "O" && second_token == "O"
          return combination[2]
        elsif second_token == "O" && third_token == "O"
          return combination[0]
        elsif first_token == "O" && third_token == "O"
          return combination[1]
        else
          return false
        end
      end

      def available_space(board)
        board.cells.each_with_index do |cell, index|
          if cell != "X" || cell != "O"
            return "#{index + 1}"
          end
        end
      end
  end
end
