require 'pry'
module Players
  class Computer < Player

    def move(board)
      if !has_tokens_choice(board).empty?
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



    def corners(board)
     board.cells.collect.with_index(1){|v, i| i if v == " "}.compact.select do |n|
        n == 1 || n == 3 || n == 7 || n == 9
      end.sample
    end

    def has_tokens(board)
      Game::WIN_COMBINATIONS.select do |x|
        x.select do |i|
          board.cells[i] == self.token
        end.count > 1
      end
    end

    def a_one_m_s(m)
      m[0]+1 unless m == nil
    end

    def has_tokens_choice(board)
      unless has_tokens(board).empty? || has_tokens(board) == nil
        has_tokens(board).flatten.select{|x| board.cells[x] == " "}
      end
    end

  end
end

  # def available_indices(board)
  #   n = board.cells.collect.with_index{|v, i| i if v == " "}.compact
  #   end
  #
  #   Game::WIN_COMBINATIONS.select do |c|
  #     c.all?{|i| board.cells[i] != " "}
  #   end
  #
  #
  #
  #   unless m.empty?
  #     m.flatten.select{|x| board.cells[x] == " "}[0]+1
  #   end.to_s
# board.update(8, self)
# board.update(5, self)
# board.update(3, self)
# board.update(7, player_2)
# board.update(9, player_2)
# 2,4,7    6,8

# a = [board.cells[0], board.cells[6], board.cells[8]].select{|p| p.strip.empty?}
#
# board.cells.count(self.token)
