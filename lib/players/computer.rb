module Players
  class Computer < Player
    attr_reader :token

    def initialize(token)
      @token = token
    end

    def move(board)
      #move returns a valid position for the computer to move
      open_cells(board).sample + 1
      #this is where AI would change input
    end

    def open_cells(board)
      #weird nil behavior from map
      arr = []
      board.cells.each_with_index do |i, index|
        arr << index if i == " "
      end
      arr
    end
  end
end
