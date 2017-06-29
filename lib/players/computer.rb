require 'pry'
module Players
  class Computer < Player
    CORNERS = [0, 2, 6, 8]
    WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]

    def move(board)
      if board.cells[4] == " "
        "5" #Always take the center if available
      else
        open_corners = CORNERS.collect{|corner| corner if board.cells[corner] == " "}# look for an open corner
        if open_corners.all?{|corner| corner != nil} #All open? pick a random open corner
          (open_corners.sample + 1).to_s
        else  #Tic-Tac-Toe is mostly blocking your opponent
          (next_move(board) + 1).to_s
        end
      end

    end


    def next_move(board)
      self.token == "X" ? opponent = "O" : opponent = "X"
      openings = search_combos(board, opponent)
      if openings[:hole]
        openings[:hole]
      else
        if openings[:open] == []
          last_move = ""
          board.cells.each_with_index{|val,ind| last_move = ind if board.cells[ind] == " "}  
          last_move
        else
          openings[:open].sample.sample #Pick a viable combination
        end
      end
    end

    def search_combos(board, token)
      openings = {
        :hole => nil,
        :open => []
      }

      WIN_COMBINATIONS.each do |combo| #TODO This can likely be simplified/refactored
        occupied_by_opponent =  combo.collect{|ind| ind if board.cells[ind] == token}
        if occupied_by_opponent.none?
            openings[:open] << combo if combo.any?{|id| board.cells[id] == self.token} #find possibilities
        end

        if occupied_by_opponent.count{|id| id != nil && id != " "} == 2
          combo.each_with_index do |val,ind|
            openings[:hole] = combo[ind] if occupied_by_opponent[ind] == nil && board.cells[val] != self.token
          end
        end

      end
      openings
    end
  end
end
