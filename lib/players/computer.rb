module Players
  class Computer < Player
    attr_reader :token

    def initialize(token)
      @token = token
    end

    def move(board)
      #this is where AI would change input

      #move returns a valid position for the computer to move
      open_cells(board).sample + 1
    end

    def open_cells(board)
      # board.cells.collect.with_index {|i, index| index if i == " "}
      arr = []
      board.cells.each_with_index do |i, index|
        arr << index if i == " "
      end
      arr
    end
  end
end
