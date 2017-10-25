module Players
  class Computer < Player

    def move(board)
      move = ""
      # If board is not taken at position 5 take it. This will work for starting the game as well as being the second player to go. If in case we are going second and the player did not select position 5, we will occupy it. We want to take position 5 over position 1, even if we are going second.
      if !board.taken?(5)
        move = "5"
      # If position 5 is taken, try to take position 1 if you are the second player to make the move.
      elsif board.turn_count == 1
        move = "1"
      # If it is second turn and we get to make a move, it means we started the game. Since we have taken position 5 on the board, try to occupy any of the 4 corners now. From the array of the 4 corners detect which corner has not been taken, then take the first not taken corner position and convert it to a string and assign it to move.
      elsif board.turn_count == 2
        move = [1, 3, 7, 9].detect{|i| !board.taken?(i)}.to_s
      # If it is turn 3 it means that we went second. Since at this point we have either position 5 or 1 taken, we want to check if the position 1 on the board has the same mark or " " as position 9 on the board or if position 3 has the same mark or " " as position 7 on the board. If either two pairs of the positions are empty, we are going to mark position 2. This means that if we have position 5, we could also have position 2 or we could have position 1 with position 2.
      elsif board.turn_count == 3 && (board.position(1) == board.position(9) || board.position(3) == board.position(7))

        move = "2"


      else
        Game::WIN_COMBINATIONS.detect do |combo|
          # Here we check to see if any of the Win Combinations on the board have the token of this player. If the board does positions marked with a token of this player, and there are two of those positions then we check if any of the empty places on the board match the win combinations. If they do we want to occupy them with this players token.
          if combo.select{|i| board.position(i+1) == token}.size == 2 && combo.any?{|i| board.position(i+1) == " "}
            move = combo.select{|i| !board.taken?(i+1)}.first.to_i.+(1).to_s
          # Else if any of the win combinations on the board are not empty, and they are not occupied with two of this player's tokens and any of the remaining positions on the board match the win combination that is empty, we want to occupy that position with this players token
          elsif combo.select{|i| board.position(i+1) != " " && board.position(i+1) != token}.size == 2 && combo.any?{|i| board.position(i+1) == " "}
            move = combo.select{|i| !board.taken?(i+1)}.first.to_i.+(1).to_s
          end
        end
        # If the above condtions were not satisfied we pick a position on the board that has not been yet occupied.
        move = [1, 3, 7, 9, 2, 4, 6, 8].detect{|i| !board.taken?(i)}.to_s if move == nil
      end
      # Returning the move as string
      move
    end
  end
end
