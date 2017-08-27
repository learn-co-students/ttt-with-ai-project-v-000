module Players
  class Computer < Player

    WIN_COMBINATIONS = Game::WIN_COMBINATIONS

    def move(board)

      puts "It's #{self.name}'s turn!"
       #checks to see if the middle is empty
      if middle?(board)
        return middle?(board)

      #checks to make sure the opponent isn't planning to trap you with three corner entries
      elsif board.turn_count == 3 && trapped?(board)
        return trapped?(board)

      #checks to see if there are any opportunities to win with the next play
      elsif winnable?(board)
        return winnable?(board)

      #checks to see if there are any opportunities to lose with the next play
      elsif loseable?(board)
        return loseable?(board)

       #checks if corners are empty
      elsif corners?(board)
        return corners?(board)

      #checks middle slots
      elsif !board.taken?("6")
        return "6"
      elsif !board.taken?("2")
        return "2"
      elsif !board.taken?("8")
        return "8"
      elsif !board.taken?("4")
        return "4"
      end

    end

    def winnable?(board)
      opportunity?(@token, board)
    end

    def loseable?(board)
      if @token == "X"
        opponent_token = "O"
      else
        opponent_token = "X"
      end
      opportunity?(opponent_token, board)
    end

    def opportunity?(token, board)
      WIN_COMBINATIONS.each do |combo|
        if board.cells[combo[0]] == token && board.cells[combo[1]] == token && board.cells[combo[2]] == " "
          return combo[2]+1
        elsif board.cells[combo[1]] == token && board.cells[combo[2]] == token && board.cells[combo[0]] == " "
          return combo[0]+1
        elsif board.cells[combo[0]] == token && board.cells[combo[2]] == token && board.cells[combo[1]] == " "
          return combo[1]+1
        end
      end

      return nil
    end

    def corners?(board)
      if !board.taken?("1")
        return "1"
      elsif !board.taken?("9")
        return "9"
      elsif !board.taken?("7")
        return "7"
      elsif !board.taken?("3")
        return "3"
      else
        return nil
      end
    end

    def middle?(board)
      if !board.taken?("5")
        return "5"
      else
        return nil
      end
    end

    def trapped?(board)
      #if there is a possibility that your opponent is planning to have three diagonal entries, force them to be defensive by selecting a middle slot
      if (board.cells[0] == board.cells[8] && board.taken?(9)) || (board.cells[2] == board.cells[6] && board.taken?(7))
        return "2"
      else
        return nil
      end
    end

  end
end
