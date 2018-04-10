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

    def move(board)
      if self.token == "X"
        other_player = "O"
      else
        other_player = "X"
      end

      #defines first move if computer is Player 1
      if board.cells.all? {|cell| cell == " "}
        "5"
      #defines first move if computer is Player 2
      elsif board.cells.count(" ") == 8
        if board.position(1) != other_player
          "1"
        else
          "5"
        end
      #defines all of computer's subsequent moves
      elsif board.cells.count(" ") > 1 && board.cells.count(" ") < 8
        #var below is what the board looks like at given win combination coordinates
        row_in_play = []                                        #ex: [" ", "X", " "]
        #var below saves the board coordinates for row_in_play
        saved_win_combination = nil                                    #ex: [3, 4, 5]
        #var below returns a computer move
        computer_selected_move = nil

        #.each iterates through all possible win combinations
        WIN_COMBINATIONS.each do |win_combination|
          saved_win_combination = win_combination

            #.each takes a snapshot of the board in play at one set of win_combination coordinates
            win_combination.each do |board_position|
              row_in_play << board.cells[board_position]
            end


          if row_in_play.count(other_player) == 2 && row_in_play.count(" ") == 1
            empty_cell = row_in_play.index(" ")
            computer_selected_move = "#{saved_win_combination[empty_cell]+1}"
            return computer_selected_move
          elsif row_in_play.count(self.token) == 2 && row_in_play.count(" ") == 1
            empty_cell = row_in_play.index(" ")
            computer_selected_move = "#{saved_win_combination[empty_cell]+1}"
            return computer_selected_move
          elsif row_in_play.include?(self.token) && !row_in_play.include?(other_player)
            empty_cell = row_in_play.index(" ")
            computer_selected_move = "#{saved_win_combination[empty_cell]+1}"
            return computer_selected_move
          elsif row_in_play.count(self.token) == 1 && row_in_play.count(other_player) == 1
            next

          else
            row_in_play.clear
          end
        end
        computer_selected_move
     end
   end

  end
end
