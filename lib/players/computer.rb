module Players
  class Computer < Player
    attr_reader :token

    def initialize(token)
      @token = token
    end

    def move(board)
      #move returns a valid position for the computer to move

      #take center if open
      if board.cells[4] == " "
        5
      elsif corner_open(board) != nil
        #take corner if open
        corner_open(board) + 1
      else
        #pick sample of remaing open cells
        open_cells(board).sample + 1
      end
    end

    def open_cells(board)
      #weird nil behavior from map
      arr = []
      board.cells.each_with_index do |i, index|
        arr << index if i == " "
      end
      arr
    end

    def corner_open(board)
      corners = [0,2,6,8].shuffle
      corners.detect do |corner|
        board.cells[corner] == " "
      end
    end

  end
end
