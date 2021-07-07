require 'pry'

module Players
  class Computer < Player

    def move(board)
      @opponent = self.token == "X" ? "O" : "X"
      if !board.taken?("5")
        "5"
      else
        next_best_move(board) + 1
      end
    end

    def next_best_move(board)
      win(board) || block(board) || corner(board) || open_cells(board) # win and block need to be fixed
    end

    def win(board)
      Game::WIN_COMBINATIONS.detect do |combination|
        if !@opponent && board.cells[combination[0]] && board.cells[combination[1]] == !board.taken?(combination[2]+1)
          result = combination[2]+1
        elsif !@opponent && board.cells[combination[1]] && board.cells[combination[2]] == !board.taken?(combination[0]+1)
          result = combination[0]+1
        elsif !@opponent && board.cells[combination[0]] && board.cells[combination[2]] == !board.taken?(combination[1]+1)
          result = combination[1]+1
        end
      end
    end

    def block(board)
      Game::WIN_COMBINATIONS.detect do |combination|
        if @opponent && board.cells[combination[0]] && board.cells[combination[1]] == !board.taken?(combination[2]+1)
          result = combination[2]+1
        elsif @opponent && board.cells[combination[1]] && board.cells[combination[2]] == !board.taken?(combination[0]+1)
          result = combination[0]+1
        elsif @opponent && board.cells[combination[0]] && board.cells[combination[2]] == !board.taken?(combination[1]+1)
          result = combination[1]+1
        end
      end
    end

    def corner(board)
      corners = [0,2,6,8]
      available_corners = corners.select{|cell| !board.taken?(cell + 1)}
      available_corners.sample
    end

    def open_cells(board)
      cells = [0,1,2,3,4,5,6,7,8]
      available_cells = cells.select{|cell| !board.taken?(cell + 1)}
      available_cells.sample
    end

  end

end
