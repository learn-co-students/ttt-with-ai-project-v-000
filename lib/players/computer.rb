require "pry"
class Player::Computer < Player
  
  # dumb version
  # def move(board) 
  #   sleep(0.3)
  #   Random.new.rand(1..9).to_s
  # end

  def move(board) # strategizing version
    if board.almost_won # win or block
      move = board.almost_won.detect { |position| !board.taken?(position) } 
      (move + 1).to_s
    elsif !board.taken?(4) # go in the center
      "5" 
    elsif board.corners.any? { |position| !board.taken?(position) } 
      move = board.corners.detect { |position| !board.taken?(position) }
      (move + 1).to_s
    else
      move = board.outer_middles.detect { |position| !board.taken?(position) }
      (move + 1).to_s
    end
  end
end


