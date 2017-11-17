module Players
class Computer < Player


  def move(board)
    move = nil
    if !board.taken?(5)
      move = "5"
    elsif board.turn_count == 1
      move = "1"
    elsif board.turn_count == 2
      move = [1, 3, 7, 9].detect do |input|
        !board.taken?(input).to_s
      end

    else
      Game::WIN_COMBINATIONS.detect do |winner|
        if cmb.select{|i| board.position(i+1) == token}.size == 2 && cmb.any?{|i| board.position(i+1) == " "}
          move = cmb.select{|i| !board.taken?(i+1)}.first.to_i.+(1).to_s
        end
      end
    end
end
end
end
