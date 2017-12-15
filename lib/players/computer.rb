require 'pry'
module Players
  class Computer < Player

    def move(board)
      move = nil

      #attempts to move to the middle if opponent hasn't gone yet
      if !board.taken?(5)
       move = "5"
      elsif board.turn_count == 1
       move = "1"
      elsif board.turn_count == 2
       move = [1, 3, 7, 9].detect{|corner| !board.taken?(corner)}.to_s
      elsif board.turn_count == 3 && (board.position(1) == board.position(3) || board.position(7) == board.position(9))
       move = "2"
      else
        #iterate through win combination to check for opponent moves
        #checks the board for opponent moves and open space to block win based on the win combinations
        Game::WIN_COMBINATIONS.detect do |combo|
          if combo.select{|i| board.position(i+1) == token}.size == 2 && combo.any?{|i| board.position(i+1) == " "}
           move = combo.select{|i| !board.taken?(i+1)}.first.to_i.+(1).to_s
          elsif combo.select{|i| board.position(i+1) != " " && board.position(i+1) != token}.size == 2 && combo.any?{|i| board.position(i+1) == " "}
           move = combo.select{|i| !board.taken?(i+1)}.first.to_i.+(1).to_s
          end
         end
        move = [1, 3, 7, 9, 2, 4, 6, 8].detect{|i| !board.taken?(i)}.to_s if move == nil
       end
      move
    end
  end
end
