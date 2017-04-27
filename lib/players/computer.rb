module Players
  class Computer < Player
    def move(board)
      move = nil

      if board.cells[4] == " "
        move = "5"

      elsif #going second and they took middle, or they went first and didn't take middle, take a corner
        board.cells.count{|i| i != " "} == 1
        move = [1, 3, 7, 9].detect{|i| !board.taken?(i)}.to_s

      else
        Game::WIN_COMBINATIONS.detect do |cmb|
          #iterate through possible win solutions to see if you can
          if cmb.select{|i| board.position(i+1) == token}.size == 2 && cmb.any?{|i| board.position(i+1) == " "}
            move = cmb.select{|i| !board.taken?(i+1)}.first.to_i.+(1).to_s
            #if not, stop the enemy from winning
          elsif cmb.select{|i| board.position(i+1) != " " && board.position(i+1) != token}.size == 2 && cmb.any?{|i| board.position(i+1) == " "}
            move = cmb.select{|i| !board.taken?(i+1)}.first.to_i.+(1).to_s
          end
        end

        move = [1, 3, 7, 9, 2, 4, 6, 8].detect{|i| !board.taken?(i)}.to_s if move == nil
      end
      move
    end
  end
end
