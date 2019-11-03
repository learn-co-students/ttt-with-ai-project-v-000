
module Players
  class Computer < Player

    def move(board)
      move = nil
      if !board.taken?(5)
        move = "5"
      elsif !board.taken?(1) || !board.taken?(3) || !board.taken?(7) || !board.taken?(9)
        move = [1, 3, 7, 9].detect{|i| !board.taken?(i)}.to_s
      else
        move = [2, 4, 6, 8].detect{|i| !board.taken?(i)}.to_s
      end

    end

   end
end


# rspec spec/03_human_player_spec.rb
