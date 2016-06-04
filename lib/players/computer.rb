class Computer < Player

  def move(board = nil)
    # m = rand(1..9).to_s
    # if !b.taken?(m) 
    #   t = next_player(b)
    #     if !better_move(b).nil?
    #       better_move(b)
    #     else
    #       return m 
    #     end
    # else
    #   move(b)
    # end
    better_move(board)
  end


  def better_move(board)
    #TODO improve AI
    b = board
    if !b.taken?(5)
      return "5"
    elsif !b.taken?(1)
      return "1"
    elsif !b.taken?(9)
      return "9"   
    elsif !b.taken?(3) 
      return "3"
    elsif !b.taken?(7)
      return "7"
    elsif !b.taken?(2)
     return "2" 
    elsif !b.taken?(6)
     return "6" 
    elsif !b.taken?(8)
      return "8" 
    elsif !b.taken?(4)
      return "4"
    end
  end

end