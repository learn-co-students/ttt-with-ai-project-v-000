require 'pry'
module Players
  class Computer < Player
    def move(board)
       input = nil
      if !board.taken?("5")
       input = "5"
      elsif board.turn_count == 1
       input = "1"
      elsif board.turn_count == 2
       input = ["1", "3", "7", "9"].detect{|i| !board.taken?(i)}
      else
       Game::WIN_COMBINATIONS.find do |w|
         if w.select{|i| board.position(i + 1) == token}.size == 2 && w.any?{|i| board.position(i + 1) == " "}
           input = w.select{|i| !board.taken?(i + 1)}.first.to_i.+(1).to_s
         elsif w.select{|i| board.position(i + 1) != " " && board.position(i + 1) != token}.size == 2 && w.any?{|i| board.position(i + 1) == " "}
           input = w.select{|i| !board.taken?(i+1)}.first.to_i.+(1).to_s
         end
        end
         input = ["5", "1", "3", "7", "9", "2", "4", "6", "8"].find{|i| !board.taken?(i)}.to_s if input == nil
       end
     input
    end
  end
end
