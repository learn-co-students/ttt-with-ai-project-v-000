require 'pry'

module Players
  class Computer < Player

    def move(board)
      if !board.taken?("5")
        "5"
      else
        next_best_move(board) + 1
      end
    end

    def next_best_move(board)
      win(board,token) || block(board,token) || corner(board) || valid_sample_array
    end

    def win(board,token)
      game.WIN_COMBINATIONS.detect do |combination|
      ((board.cells[combination[0]] == token && board.cells[combination[1]] == token) && !board.taken?(combination[2]+1)) ||
      ((board.cells[combination[1]] == token && board.cells[combination[2]] == token) && !board.taken?(combination[0]+1)) ||
      ((board.cells[combination[0]] == token && board.cells[combination[2]] == token) && !board.taken?(combination[1]+1))
      end
    end

    def block(board,token)
      game.WIN_COMBINATIONS.detect do |combination|
      ((board.cells[combination[0]] == !token && board.cells[combination[1]] == !token) && !board.taken?(combination[2]+1)) ||
      ((board.cells[combination[1]] == !token && board.cells[combination[2]] == !token) && !board.taken?(combination[0]+1)) ||
      ((board.cells[combination[0]] == !token && board.cells[combination[2]] == !token) && !board.taken?(combination[1]+1))
      end
    end

    def corner(board)
      corners = [0,2,6,8]
      available_corners = corners.select{|cell| !board.taken?(cell + 1)}
      available_corners.sample
    end

    def open_cells(board)
      cells = [0,1,2,3,4,5,6,7,8]
      available_cells = cells.detect{|cell| !board.taken?(cell + 1)}
      available_cells.sample
    end

  end

end
