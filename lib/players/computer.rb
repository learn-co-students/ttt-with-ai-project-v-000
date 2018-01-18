require 'pry'
module Players

  class Computer < Player



    def opponent_token
      if self.token == "X"
        @opponent_token = "O"
      else @opponent_token = "X"
      end
    end



    def move(board) #come up with an algorithm that looks at the state of the board and how many turns have been played, and then returns a string that is the desired move position
      puts "Computer player #{token}, please enter a number 1-9"
      if can_next_move_win(board, @opponent_token) != nil
        defense(board)
      elsif board.turn_count == 0
        center(board)
      elsif board.turn_count == 1 && !board.taken?(5)
        center(board)
      #elsif board.taken?(5) && board.turn_count == 1
      #  3

      elsif can_next_move_win(board, self.token) != nil
        win(board)
      else
        random_move(board) #|| corner(board) #|| win(board) || defense(board)
      end

    end




    def center(board)
      return "5" unless board.taken?(5)
    end

    def corner(board)
      corners = ["1", "3", "7", "9"]
    if corners.collect { |corner_value| board.taken?(corner_value) }.include?(false)
      potential_move = corners.sample

      potential_move
    else
      false
    end
  end




    def random_move(board)
      string_input = (rand(9) + 1).to_s until board.valid_move?(string_input)
      string_input
    end

    def win(board)
      winning_combo = can_next_move_win(board, self.token)
      if winning_combo != nil
        winning_position = winning_combo.detect {|position| !board.taken?(position + 1)}
        return (winning_position + 1)
      end
    end




    def defense(board) #returns where to move to block opponent

      winning_combo = can_next_move_win(board, @opponent_token)
      winning_position = winning_combo.detect {|position| !position.taken?(position + 1)}
      return (winning_position + 1)
    end


    def can_next_move_win(board, players_token)  #returns a winning combo that can win game with one move. accepts board and a token; so you can search this to see if self will win, or if opponent will win
      Game::WIN_COMBINATIONS.find do |win_combo| #search through the win_combos contained in WIN_COMBINATIONS
        #remember that win_combo is an array of POSITIONS on the board. so it will return position value u can plug into @cells
        #notice the +1 in the taken expression. this is because taken has built within it to subtract 1
      (board.cells[win_combo[0]] == players_token && board.cells[win_combo[1]] == players_token && !board.taken?(win_combo[2]+1)) ||
      (board.cells[win_combo[1]] == players_token && board.cells[win_combo[2]] == players_token && !board.taken?(win_combo[0]+1)) ||
      (board.cells[win_combo[0]] == players_token && board.cells[win_combo[2]] == players_token && !board.taken?(win_combo[1]+1))
      #WHAT ARE WE RETURNING? a win_combo (set of integers that are positions to plug into @cells) that has 2/3 of the same token, and a third space free
    end







  end
end

end
