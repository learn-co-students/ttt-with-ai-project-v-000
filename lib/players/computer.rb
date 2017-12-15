require 'pry'
module Players
  class Computer < Player

    def move(board)
      if !board.taken?("5")
        "5"
      elsif corners(board)
        corners(board)
      else
      board.cells.collect.with_index do |v,i|
         (i+1).to_s if v == " "
       end.compact.sample
     end
    end

    def combos(board)
      Game::WIN_COMBINATIONS.select do |x|
        x.any?{|i| board.cells[i] == token}
       end
    end

    def best_choice(board)
      unless combos(board).empty?
      combos(board).select do |i|
         if board.cells[i[0]] && board.cells[i[1]] == token || board.cells[i[0]] && board.cells[i[2]] == token || board.cells[i[1]] && board.cells[i[2]] == token
            i
         elsif board.cells[i[0]] == token
         end
       end
     end
    end

    def corners(board)
    n = board.cells.collect.with_index{|v, i| i if v == " "}.select do |n|
        n == 0 || n == 2 || n == 6 || n == 8
      end.sample+1
    end

  end
end

# a = [board.cells[0], board.cells[6], board.cells[8]].select{|p| p.strip.empty?}
#
# Game::WIN_COMBINATIONS.collect.with_index


#  (f.select{|x| board.cells[x] != token}[0] + 1).to_s

 # l = Game::WIN_COMBINATIONS.collect do |x|
 #    x.count(8).sum
 #  end
