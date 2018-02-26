module Players

  class Computer < Player
    attr_accessor :board, :game, :move_ind

    WIN_COMBINATIONS = [[0,4,8], [6,4,2], [0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8]]

    def move(board = Board.new)

      if self.game != nil
        @positions = self.game.board.cells
        corners = []
        until corners.length == 4 do
          num = rand(0..8)
          if num.even? && !corners.include?(num) && num != 4
            corners << num
          end
        end
        open_positions = @positions.collect.with_index{|pos, i| i if pos == " "} - [nil]
        taken_positions = @positions.collect.with_index{|pos, i| i if pos != " "} - [nil]
        @move_ind = open_positions.sample

        if self.game.board.turn_count == 0
          @move_ind = corners.first
        elsif self.game.board.turn_count == 1 && @positions[4] == " "
          @move_ind = 4
        elsif self.game.board.turn_count == 1 && @positions[4] != " "
          @move_ind = corners.last
        elsif self.game.board.turn_count == 2
          @move_ind = corners.last
        elsif find_win
          find_win
        end
      else
        @move_ind = board.cells.collect.with_index{|pos, i| i if pos == " "}.sample
      end
      move_num = @move_ind + 1
      move_num.to_s
    end

    def opponent_token
      if self.token == 'X'
         opponent_token = 'O'
      else
        opponent_token = 'X'
      end
    end

    def find_win
      WIN_COMBINATIONS.each do |win_arr|
        if @positions[win_arr.first] == self.opponent_token && @positions[win_arr[1]] == self.opponent_token && @positions[win_arr.last] == " "
                @move_ind = win_arr.last
        elsif @positions[win_arr[1]] == self.opponent_token && @positions[win_arr.last] == self.opponent_token && @positions[win_arr.first] == " "
                @move_ind = win_arr.first
        elsif @positions[win_arr.first] == self.opponent_token && @positions[win_arr.last] == self.opponent_token && @positions[win_arr[1]] == " "
                @move_ind = win_arr[1]
        end
      end
    end

  end

end
