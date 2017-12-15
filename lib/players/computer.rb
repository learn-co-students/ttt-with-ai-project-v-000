require 'pry'
module Players
  class Computer < Player

    def move(board)
      if has_tokens_choice(board)
        has_tokens_choice(board)
      elsif !board.taken?("5")
        "5"
        binding.pry
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

    def has_tokens(board)
      Game::WIN_COMBINATIONS.select do |x|
        x.select{|i| board.cells[i] == self.token}.count > 1
      end
    end

    def has_tokens_choice(board)
      if !has_tokens(board).empty?
        has_tokens(board).flatten.select{|x| board.cells[x] != token}[0]+1
      end
    end

  end
end


# board.update(8, self)
# board.update(5, self)
# board.update(3, self)
# board.update(7, player_2)
# board.update(9, player_2)
# 2,4,7    6,8

# a = [board.cells[0], board.cells[6], board.cells[8]].select{|p| p.strip.empty?}
#
# board.cells.count(self.token)
