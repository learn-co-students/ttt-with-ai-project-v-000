module Players
  class Computer < Player

    def move(board)
      move = nil

      #if going first take mid
      if board.cells[4] == " "
        move = "5"
        #if going second and they took mid, take top left
      elsif board.cells[4] != " "
        move = "1"

        #check the rest of the corners for a good move (turn 3)
      elsif board.cells[4] != " " && board.cells[1] != " "
        move = [1, 3, 7, 9].detect {|i| !board.taken?(i)}.to_s

        #check if there are winning combinations available, and either win or stop it.
      elsif (board.position(1) == board.position(3))
        move = "2"

      elsif (board.position(3) == board.position(9))
        move = "6"

      elsif (board.position(7) == board.position(9))
        move = "8"

      elsif (board.position(1) == board.position(7))
        move = "4"

      else
        Game::WIN_COMBINATIONS.detect do |combo|

          #first check if we can win.
          if combo.select{|i| board.position(i+1) == token}.size == 2 && combo.any?{|i| board.position(i+1) == " "}

            move = combo.select{|i| !board.taken?(i+1)}.first.to_i.+(1).to_s

          #if we can't win, block your opponent from doing so

          elsif combo.select{|i| board.position(i+1) != " " && board.position(i+1) != token}.size == 2 && combo.any?{|i| board.position(i+1) == " "}

            move = combo.select{|i| !board.taken?(i+1)}.first.to_i.+(1).to_s
          end
        end

        #if no win combinations possible, play a square

        move = [1, 3, 7, 9, 2, 4, 6, 8].detect{|i| !board.taken?(i)|.to_s if move == nil}
      end
      move
    end
  end
end
