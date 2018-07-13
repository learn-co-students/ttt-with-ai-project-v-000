module Players
  class Human < Player
    def move(board)
      puts "Please input the number(1-9) of the square where you'd like to make your move: "
      input = gets.strip
      input
    end
  end

  class Computer < Player
    WINNING_COMBINATIONS = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6]
    ]

    def move(board)
      player_token = self.token

      if player_token == "X"
        opponent_token = "O"
      elsif player_token == "O"
        opponent_token = "X"
      end

      board_array = board.cells

      WINNING_COMBINATIONS.each do |combination|

        win_index_1 = combination[0]
        win_index_2 = combination[1]
        win_index_3 = combination[2]

        position_1 = board_array[win_index_1]
        position_2 = board_array[win_index_2]
        position_3 = board_array[win_index_3]

        move_index_1 = "#{win_index_1 + 1}"
        move_index_2 = "#{win_index_2 + 1}"
        move_index_3 = "#{win_index_3 + 1}"

        # Initial move
        if board_array[0] != opponent_token && board_array[2] != opponent_token && board_array[6] != opponent_token && board_array[8] != opponent_token && board.valid_move?("5")
          return "5"
        # Final defensive moves
        elsif position_1 == opponent_token && position_2 == opponent_token && board.valid_move?(move_index_3)
          return move_index_3
        elsif position_1 == opponent_token && position_3 == opponent_token && board.valid_move?(move_index_2)
          return move_index_2
        elsif position_2 == opponent_token && position_3 == opponent_token && board.valid_move?(move_index_1)
          return move_index_1
        end
      end

      # Intermediate defesive moves
      if board_array[4] == opponent_token && board_array[8] == opponent_token && board.valid_move?("3")
        return "3"
      elsif board_array[4] == opponent_token && board_array[6] == opponent_token && board.valid_move?("1")
        return "1"
      elsif board_array[4] == opponent_token && board_array[2] == opponent_token && board.valid_move?("9")
        return "9"
      elsif board_array[4] == opponent_token && board_array[0] == opponent_token && board.valid_move?("7")
        return "7"
      elsif board_array[0] == opponent_token && board.valid_move?("9")
        return "9"
      elsif board_array[2] == opponent_token && board.valid_move?("7")
        return "7"
      elsif board_array[6] == opponent_token && board.valid_move?("3")
        return "3"

      elsif board_array[8] == opponent_token && board.valid_move?("1")
        return "1"
      end

      WINNING_COMBINATIONS.each do |combination|

        win_index_1 = combination[0]
        win_index_2 = combination[1]
        win_index_3 = combination[2]

        position_1 = board_array[win_index_1]
        position_2 = board_array[win_index_2]
        position_3 = board_array[win_index_3]

        move_index_1 = "#{win_index_1 + 1}"
        move_index_2 = "#{win_index_2 + 1}"
        move_index_3 = "#{win_index_3 + 1}"

        # Final offensive moves
        if position_1 == player_token && position_2 == player_token && board.valid_move?(move_index_3)
          return move_index_3
        elsif position_1 == player_token && position_3 == player_token && board.valid_move?(move_index_2)
          return move_index_2
        elsif position_2 == player_token && position_3 == player_token && board.valid_move?(move_index_1)
          return move_index_1
        end
        # Initial moves
        if board.valid_move?(move_index_1)
          return move_index_1
        elsif board.valid_move?(move_index_2)
          return move_index_2
        elsif board.valid_move?(move_index_3)
          return move_index_3
        end
      end
    end
  end
end
