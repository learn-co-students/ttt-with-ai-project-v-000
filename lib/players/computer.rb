require 'pry'
module Players
  class Computer < Player

      def move(board)
        corner_play = ["1","3","7","9"]
        all_moves = ["1","2","3","4","5","6","7","8","9"]
        move = ""

        if board.cells[4] == " "
          move = "5"
        elsif board.turn_count == 1
          move = corner_play.sample
        elsif board.turn_count ==  2
          move = corner_play.detect{|move| !board.taken?(move)}
        elsif board.turn_count == 3 && (board.position(1) == board.position(9) || board.position(3) == board.position(7))
            move = corner_play.detect{|move| !board.taken?(move)}
        else
          Game::WIN_COMBINATIONS.each do |win_combo|
            if  win_combo.select{ |i| board.position(i+1) == token}.size == 2 && win_combo.any?{|i| board.position(i+1) == " "}
              move = win_combo.select{|i| !board.taken?(i+1)}.first.to_i.+(1)
            elsif win_combo.select{|i| board.position(i+1) != " " && board.position(i+1) != token}.size == 2 && win_combo.any?{|i| board.position(i+1) == " "}
              move = win_combo.select{|i| !board.taken?(i+1)}.first.to_i.+(1)
            end
          end
            move = all_moves.detect{|i| !board.taken?(i)} if move == ""
        end
         move
     end
   end
end
