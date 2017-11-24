module MiniMax
  def score
    if won?  and winner=="X"
        return 10
    elsif won? and winner=="O"
        return -10
    else
      if draw?
          return 0
        else
          return nil
        end
    end
  end

end
