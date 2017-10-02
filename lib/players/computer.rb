module Players

class Computer < Player

  def move(board)
    move = nil || false
    if board.taken?(5)
      move = "5"
    elsif board.turn_count == 1
      move = "1"
    elsif  board.turn_count == 2
      move = [1, 9, 7, 3].detect {|x| !board.taken?(x)}.to_s
    elsif board.turn_count == 3 && (board.position(1) == board.position(3)) || (board.position(5) == board.position(8))
      move = "2"
    else Game::WIN_COMBINATIONS.detect do |combo|
       if combo.select {|x| board.position(x-1) == token }.size == 2 && combo.any?{|x| x == " "}
         move = combo.select {|x|!board.taken?(x+1)}.to_i
       end
     end
      move = rand(1..9).to_s

    end


  end




end
end
