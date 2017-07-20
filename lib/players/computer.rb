module Players
  class Computer < Player
    def move(board)
      make_move = nil
      if first_move(board)
        make_move = first_move(board)
      else
        Game::WIN_COMBINATIONS.each do |win_combination|
          if find_my_winning_move(board, win_combination)
            make_move = find_my_winning_move(board, win_combination)
          elsif find_opponents_winning_move(board, win_combination)
            make_move = find_opponents_winning_move(board, win_combination)
          end
        end
      end
      make_move = move_in_any_available_position(board) if make_move == nil
      make_move
    end

    private

    def first_move(board)
      "5" if board.valid_move?(5)
    end

    def find_my_winning_move(board, win_combination)
      make_move = nil
      combination = []
      win_combination.each do |index|
        combination << index if board.position(index + 1) == token
      end

      if combination.size == 2
        make_move = win_combination.detect do |index|
          board.position(index + 1) == " "
        end
      end
      (make_move + 1).to_s if make_move != nil
    end

    def find_opponents_winning_move(board, win_combination)
      make_move = nil
      combination = []
      win_combination.each do |index|
        combination << index if board.position(index + 1) != token && board.position(index + 1) != " "
      end

      if combination.size == 2
        make_move = win_combination.detect do |index|
          board.position(index + 1) == " "
        end
      end

      (make_move + 1).to_s if make_move != nil

    end



    def not_my_token_or_empty_position_and_valid_move?(input1, input2, input3, board)
      board.position(input1) != token && board.position(input2) != token && board.position(input1) != " " && board.position(input2) != " " && board.position(input3) == " "
    end

    def my_token_and_valid_move?(input1, input2, input3, board)
      board.position(input1) == token && board.position(input2) == token && board.position(input3) == " "
    end

    def find_unblocked_corner(board)
      make_move = nil
      make_move = [1,3,7,9].detect do |index|
        board.valid_move?(index)
      end
      make_move.to_s if make_move != nil
    end

    def move_in_any_available_position(board)
      make_move = nil
      move_index = [0,2,3,4,5,6,7,8].detect do |index|
        board.valid_move?(index + 1)
      end
      make_move = move_index + 1
      make_move.to_s
    end
  end
end
