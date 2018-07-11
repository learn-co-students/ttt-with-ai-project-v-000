require 'pry'
module Players
  class Computer < Player
    attr_accessor :board
    WIN_COMBINATIONS = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [6, 4, 2]
    ]
    CORNERS = [0, 2, 8, 6]

    #winning move?
    #a. iterate over winning combos and see if any of them have 2 cells that equal current_player.token and one valid_move?
    #b. winning move
    #block?
    #a. iterate over winning combos and see if any of them have 2 cells that equal other_player.token and one valid_move?
    #b. blocking move
    #center?
    #a. check if board.cells[4] is a valid move
    #b. take center
    #corners?
    #a. iterate over the corners and see if any of them == other_player.token
    #b. if yes take the opposite corner
    #c. if no iterate over the corners and see if any of them == current_player.token
    #d. if yes take the opposite corner
    #e. if no take any corner
    #random
    #a. make random move
    def move(board)
      @board = board

      case
      when winning_move != nil
        input = winning_move + 1
      when blocking_move != nil
        input = blocking_move + 1
      when center = " "
        input = 5
      when opposite_corner != nil && !@board.cells.taken?(opposite_corner)
        input = opposite_corner
      when corner
        input = corner + 1
      else
        until !@board.taken?(input)
          input = (1..9).to_a.sample
        end
      end
      input.to_s
    end

    def opponent
      token == "X" ? "O" : "X"
    end

    def winning_move
      winning_row = WIN_COMBINATIONS.find do |combo|
        (@board.cells[combo[0]] == token && @board.cells[combo[1]] == token && @board.cells[combo[2]] == " ") || (@board.cells[combo[2]] == token && @board.cells[combo[1]] == token && @board.cells[combo[0]] == " ") || (@board.cells[combo[0]] == token && @board.cells[combo[2]] == token && @board.cells[combo[1]] == " ")
      end
      if winning_row != nil
        winning_cell = winning_row.find {|cell| @board.cells[cell] == " "}
      end
    end

    def blocking_move
      winning_row = WIN_COMBINATIONS.find do |combo|
        (@board.cells[combo[0]] == opponent && @board.cells[combo[1]] == opponent && @board.cells[combo[2]] == " ") || (@board.cells[combo[2]] == opponent && @board.cells[combo[1]] == opponent && @board.cells[combo[0]] == " ") || (@board.cells[combo[0]] == opponent && @board.cells[combo[2]] == opponent && @board.cells[combo[1]] == " ")
      end
      if winning_row != nil
        winning_cell = winning_row.find {|cell| @board.cells[cell] == " "}
      end
    end

    def center
      @board.cells[4] == " "
    end

    def opposite_corner
      case
      when @board.taken?(9) && !@board.taken?(1)
        1
      when @board.taken?(1) && !@board.taken?(9)
        9
      when @board.taken?(7) && !@board.taken?(3)
        3
      when @board.taken?(3) && !@board.taken?(7)
        7
      else
        nil
      end
    end

    def corner
      CORNERS.shuffle!
    end
  end
end
