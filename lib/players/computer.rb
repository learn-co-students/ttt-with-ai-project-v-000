module Players
  class Computer < Player

    def move(board)
      move = nil
      if !board.taken?(5)
        move = "5"
      elsif !board.taken?(1)
        move = [1, 3, 7, 9].detect{|num| !board.taken?(num)}
      else
        Game::WIN_COMBINATIONS.detect do |winning|
          if winning.select{|num| board.position(num+1) == token}.size == 2 && winning.any?{|num| board.position(num+1) == " "}
            move = winning.select{|num| !board.taken?(num+1)}.first.to_i.+(1).to_s
          elsif winning.select{|num| board.position(num+1) != " " && board.position(num+1) != token}.size == 2 && winning.any?{|num| board.position(num+1) == " "}
            move = winning.select{|num| !board.taken?(num+1)}.first.to_i.+(1).to_s
          end
        end
        move = [1, 3, 7, 9, 2, 4, 6, 8].detect{|num| !board.taken?(num)}.to_s if move == nil
      end
      move
    end
  end
end
