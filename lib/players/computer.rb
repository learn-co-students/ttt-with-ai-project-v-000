module Players
  class Computer < Player

    WIN_COMBINATIONS = [
      [0,1,2],
      [3,4,5],
      [6,7,8],
      [0,3,6],
      [1,4,7],
      [2,5,8],
      [0,4,8],
      [6,4,2]
    ]



    WIN_COMBINATIONS.each do |winning_combo| #[0,1,2]
      winning_count = winning.select do |cell| #cell = 0 OR 1 OR 2
        board.cells[cell] == self.token #return " " OR "X" OR "O"
      end.count == 2 #if 2 or more

      if winning_count == 2
        winning_combo.detect {|index| board.cells[index] == " "}
      end
    end

    def move(board)
      case
      #when 2 current player token are in a row, select third option
      when board.cells[0] == self.token && board.cells[1] == self.token
        "2"
      when board.cells[1] == self.token && board.cells[2] == self.token
        "0"
      when board.cells[0] == self.token && board.cells[2] == self.token
        "1"
      when board.cells[3] == self.token && board.cells[4] == self.token
        "5"
      when board.cells[3] == self.token && board.cells[5] == self.token
        "4"
      when board.cells[4] == self.token && board.cells[5] == self.token
        "3"
        

      when board.cells.all? {|cell| cell == " "}
        "4"
      end

    end


  end
end
