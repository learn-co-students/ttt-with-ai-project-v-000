module Players
  class Computer < Player

    attr_accessor :board

    WIN_COMBINATIONS = [
      [0,1,2],
      [3,4,5],
      [6,7,8],
      [0,3,6],
      [1,4,7],
      [2,5,8],
      [0,4,8],
      [2,4,6]
      ]

    def move(board)
      @board = board
      case
      when winning_move != nil
        input = winning_move + 1
      when blocking_move != nil
        input = blocking_move + 1
      when center_empty?
        input = 5
      when opposite_corner != nil
        input = opposite_corner
      when corners != nil
        input = corners + 1
      else
        input = rand(1..9)
      end
      input.to_s
    end

    #1- Find a winning move
    def winning_move
      win_combo = WIN_COMBINATIONS.find do |combo|
        (@board.cells[combo[0]] == @token && @board.cells[combo[1]] == @token && @board.cells[combo[2]] == " ") || (@board.cells[combo[0]] == @token && @board.cells[combo[2]] == @token && @board.cells[combo[1]] == " ") || (@board.cells[combo[1]] == @token && @board.cells[combo[2]] == @token && @board.cells[combo[0]] == " ")
      end
      if win_combo != nil
        win_cell = win_combo.find do |spot|
          @board.cells[spot] == " "
        end
      end
    end


    #2- Find a blocking move-- need a way to identify other token first
    def other_token
      if @token == "X"
        "O"
      else
        "X"
      end
    end

    def blocking_move
      block_combo = WIN_COMBINATIONS.find do |combo|
        (@board.cells[combo[0]] == other_token && @board.cells[combo[1]] == other_token && @board.cells[combo[2]] == " ") || (@board.cells[combo[0]] == other_token && @board.cells[combo[2]] == other_token && @board.cells[combo[1]] == " ") || (@board.cells[combo[1]] == other_token && @board.cells[combo[2]] == other_token && @board.cells[combo[0]] == " ")
      end
      if block_combo != nil
        block_cell = block_combo.find do |spot|
          @board.cells[spot] == " "
        end
      end
    end

    #3- Take the center if it's empty
    def center_empty?
      @board.cells[4] == " "
    end

    #4- Find the opposite corner
    def opposite_corner
      if @board.taken?(1) && !@board.taken?(9)
        9
      elsif @board.taken?(9) && !@board.taken?(1)
        1
      elsif @board.taken?(3) && !@board.taken?(7)
        7
      elsif @board.taken?(7) && !@board.taken?(3)
        3
      else
        nil
      end
    end

    #5- Find any open corner
    def corners
      [0, 2, 6, 8].find do |corner|
        @board.cells[corner] == " "
      end
    end

  end
end
