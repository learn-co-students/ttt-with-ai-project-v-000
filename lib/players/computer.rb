require 'pry'
module Players
  class Computer < Player
    def move(board)
      win = find_win(board)
      if win != nil
        return win
      end
      block = find_block(board)
      if block != nil
        return block
      end
      counter = 1
      while counter < 8
        if board.valid_move?(counter) == true
          return counter.to_s
        end
        counter += 1
      end
    end
    #Redunant- Can probably refactor for win and block to be encapsulated into 1 method but with token argument.
    def find_win(board)
      Game::WIN_COMBINATIONS.each do |win_array|
        win_index_1 = win_array[0]
        win_index_2 = win_array[1]
        win_index_3 = win_array[2]

        if board.cells[win_index_1] == self.token
          position1 = true
        end
        if board.cells[win_index_2] == self.token
          position2 = true
        end
        if board.cells[win_index_3] == self.token
          position3 = true
        end
        win = [position1, position2, position3]
        i = win.each_index.select{|i| win[i] == true}
        if i.length == 2
          if i.include?(0) == false
            result = board.valid_move?(win_index_1 + 1)
            if result == true
              return (win_index_1 + 1)
            end
          elsif i.include?(1) == false
            result = board.valid_move?(win_index_2 + 1)
            if result == true
              return (win_index_2 + 1)
            end
          else
            result = board.valid_move?(win_index_3 + 1)
            if result == true
              return (win_index_3 + 1)
            end
          end
        end
      end
      return nil
    end
    def find_block(board)
      if self.token == "X"
        opponent = "O"
      else
        opponent = "X"
      end
      Game::WIN_COMBINATIONS.each do |win_array|
        win_index_1 = win_array[0]
        win_index_2 = win_array[1]
        win_index_3 = win_array[2]

        if board.cells[win_index_1] == opponent
          position1 = true
        end
        if board.cells[win_index_2] == opponent
          position2 = true
        end
        if board.cells[win_index_3] == opponent
          position3 = true
        end
        win = [position1, position2, position3]
        i = win.each_index.select{|i| win[i] == true}
        if i.length == 2
          if i.include?(0) == false
            result = board.valid_move?(win_index_1 + 1)
            if result == true
              return (win_index_1 + 1)
            end
          elsif i.include?(1) == false
            result = board.valid_move?(win_index_2 + 1)
            if result == true
              return (win_index_2 + 1)
            end
          else
            result = board.valid_move?(win_index_3 + 1)
            if result == true
              return (win_index_3 + 1)
            end
          end
        end
      end
      return nil
    end
  end
end
