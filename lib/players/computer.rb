require 'pry'
module Players
  class Computer < Player

    def move(board)
      # if !board.taken?("5")
      #   "5"
        binding.pry
      board.cells.collect.with_index do |v,i|
         (i+1).to_s if v == " "
       end.compact.sample
    end

  end
end

m = Game::WIN_COMBINATIONS.select do |x|
  x.any?{|i| board.cells[i] == token}
 end

f = m.select do |i|
   if board.cells[i[0]] && board.cells[i[1]] == token || board.cells[i[0]] && board.cells[i[2]] == token || board.cells[i[1]] && board.cells[i[2]] == token
     i
   elsif board.cells[i[0]] == token
   end
 end.flatten

 f.select{|x| board.cells[x] != token}[0] + 1
