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
      else
        #pick sample of remaing open cells
        open_cells(board).sample + 1
      end
      # until corner_cells(board) == nil
      #   #check for winning combo
      #      check_for_win
      #   #take corner if open
      #      corner_cells(board)
      # end
    end

    # def open_cells(board)
    #   #weird nil behavior from map
    #   arr = []
    #   board.cells.each_with_index do |i, index|
    #     arr << index if i == " "
    #   end
    #   arr
    # end
    #
    # def corner_cells(board)
    #   corners = [0,2,5,7]
    #     corners.detect do |corner|
    #       open_cells(board)[corner] == corner
    #     end
    #   end
    # end

    # def check_for_win
    #
    # end
  end
end
