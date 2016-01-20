class Computer < Player

  def move(board)
    puts "You can't beat me!"
    turns = board.turn_count
    case turns
      when 0
        1
      when 1
        board.taken?(5) ? 1 : 5
      when 2
        o = board.cells.index("O")
        case o
          when 4  #can't guarantee win
            3
          when 1, 5
            7
          when 2, 6
            9
          when 3, 8, 7
            3
        end
      when 3
        if board.cells[4] == "X"
          if board.cells[1] == "X"
            8
          elsif board.cells[2] == "X"
            7
          elsif board.cells[3] == "X"
            6
          elsif board.cells[5] == "X"
            4
          elsif board.cells[6] == "X" || board.cells[8] == "X"
            3
          elsif board.cells[7] == "X"
            2
          end
        else
          react(board) + 1
        end
      when 4
        if board.cells[8] == "X"
          if board.cells[4] == "O"
            board.taken?(7) ? 3 : 7
          else
            5
          end
        elsif board.cells[6] == "X"
          board.taken?(4) ? 5 : 4  #trap
        else
          if board.taken?(2)
            if board.cells[4] == "O"  #can't guarantee win
              8
            elsif board.cells[8] == "O"  #trap
              7
            else #trap
              5
            end
          else
            2  #win
          end
        end
      when 5
      react(board) + 1
      when 6
        if board.cells[4] == "X"
          if board.taken?(9)
            board.taken?(7) ? 3 : 7
          else
            9
          end
        elsif board.cells[8] == "X" && board.cells[6] == "X"
          board.taken?(4) ? 8 : 4
        elsif board.cells[8] == "X" && board.cells[2] == "X"
          board.taken?(2) ? 6 : 2
        elsif board.cells[8] == "O"
          board.taken?(4) ? 5 : 4
        else  #can't guarantee win
          if board.taken?(9)
            board.taken?(4) ? 6 : 4
          else
            board.taken?(6) ? 4 : 6
          end
        end
      when 7
        if react(board)
          react(board) + 1
        else
          6
        end
      when 8
        board.cells.index(" ") + 1
    end
  end

  def almost?(board, token)
    Game::WIN_COMBINATIONS.detect do |win_combo|
      (
        (board.cells[win_combo[0]] == token && board.cells[win_combo[1]] == token) &&
        !board.taken?(win_combo[2]+1)
      ) ||
      (
        (board.cells[win_combo[1]] == token && board.cells[win_combo[2]] == token) &&
        !board.taken?(win_combo[0]+1)
      ) ||
      (
        (board.cells[win_combo[0]] == token && board.cells[win_combo[2]] == token) &&
        !board.taken?(win_combo[1]+1)
      )
    end
  end

  def win(board)
    winning_combo = almost?(board, "O")
    if winning_combo && winning_combo.count{|index| board.position(index+1) == "O"} == 2
      winning_combo.detect{|index| !board.taken?(index+1)}
    end
  end

  def block(board)
    blocking_combo = almost?(board, "X")
    if blocking_combo && blocking_combo.count{|index| board.position(index+1) == "X"} == 2
      blocking_combo.detect{|index| !board.taken?(index+1)}
    end
  end

  def corner_or_side(board)
    if (board.cells[0] == board.cells[8] && board.cells[0] != " ") || (board.cells[2] == board.cells[6] && board.cells[2] != " ")
      [1,3,5,7].detect{|cell| !board.taken?(cell+1)}
    else
      [0,2,6,8].detect{|cell| !board.taken?(cell+1)}
    end
  end

  def react(board)
    win(board) || block(board) || corner_or_side(board)
  end

end