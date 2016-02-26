class Computer < Player

  def move(token)
    return rand(1..9).to_s
  end

end