module Players
  class Computer < Player
    attr_reader :token, :winning_combos

    def initialize(token)
      @token = token
      @winning_combos = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
    end

    def move(board)
      #move returns a valid position for the computer to move

      #take center if open
      if board.cells[4] == " "
        5
      elsif !win_or_block(board).nil?
        #return index of next move if possible wins or blocks
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

    def possible_win(board)
      # returns array of possible win combos with only one space empty

      #current board cells
      slot = board.cells
      #looks at each winning combo and indexes to board
      winning_combos.select do |combo|
        #winning row example - [3,4,5]
        row = [slot[combo[0]], slot[combo[1]], slot[combo[2]]]
        #skip row if more than 2 empty cells
        if row.select {|cell| cell = " "}.length >= 2
          next
        #if two of same item exzist, capture that combo
        elsif !row[0].nil? && row[0] == row[1]
         combo
        elsif !row[0].nil? && row[0] == row[2]
          combo
        end
      end
    end

    def win_or_block(board)
      #array of win combos with one space empty
      combos = possible_win(board)
      cells  = board.cells

      if combos.empty?
        nil
      else
        # return index if block or win if nothing returns nil
        combos.detect do |combo|
          #if first and second slot are YOUR token, return & win index of slot3
          if combo[0] == combo[1] && combo[0] == self.token
            cells[combo[3]]
            #if second and third slot are YOUR token, return & win index of slot3
          elsif combo[0] == combo[2] && combo[0] == self.token
            cells[combo[2]]
            #if first and second slot are NOT YOUR token, return & block index of slot3
          elsif combo[0] == combo[1] && combo[0] == !self.token
            cells[combo[3]]
            #if second and third slot are NOT YOUR token, return & block index of slot3
          elsif combo[0] == combo[2] && combo[0] == self.token
            cells[combo[2]]
          end
        end
      end
    end
  end
end
