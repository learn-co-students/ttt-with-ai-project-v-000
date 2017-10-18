require 'pry'


module Players

  class Computer < Player

    def move(board)
      # Remember -- for Game#turn to work, #move has to return a string that is one higher than the index number of the
      # cell it wants to take.
      position = nil
        # Computer looks for center square first and take it if open
      if board.cells[4] == " "
         position = 5
         puts "#{token} chose #{position} because it likes the middle."
          # If center square is not open, computer goes through each of the winning combos.  See if its own token has 2
          # out of the three spots and if  the third spot is open. Take the open spot if so to win.
      elsif open_spot_to_win_or_block?(board, token)
        position = open_spot_to_win_or_block?(board, token)
        puts "#{token} chose #{position} to win."
          # If computer cannot win, it goes through each of the winning combos.  See if its opponent has 2 out of the three
          # spots and if the third spot is open. Take the open spot if so to block opponent.
      elsif open_spot_to_win_or_block?(board, alt_token)
        position = open_spot_to_win_or_block?(board, alt_token)
        puts "#{token} chose #{position} to block."
          #If computer cannot win or block, it picks a random open space.
      else
         position = find_random_open_spot(board)
         puts "#{token} chose #{position} randomly."
      end
          # Return the position computer has chosen as a string.
      position.to_s
    end


    def open_spot_to_win_or_block?(board, test_token)
      position = nil
      board.win_combinations.each do |combo|
        if board.cells[combo[0]] == test_token && board.cells[combo[0]] == board.cells[combo[1]] && board.cells[combo[2]] == " "
          position = combo[2]+1
        elsif board.cells[combo[0]] == test_token && board.cells[combo[0]] == board.cells[combo[2]] && board.cells[combo[1]] == " "
          position = combo[1]+1
        elsif board.cells[combo[1]] == test_token && board.cells[combo[1]] == board.cells[combo[2]] && board.cells[combo[0]] == " "
          position = combo[0]+1
        end
      end
      position
    end

    def alt_token
      self.token == "X" ? "O" : "X"
    end

    def find_random_open_spot(board)
      test_spot = rand(0..8)
      if board.cells[test_spot] == " "
        test_spot + 1
      else
        find_random_open_spot(board)
      end
    end

  end #Class end

end #Module end
