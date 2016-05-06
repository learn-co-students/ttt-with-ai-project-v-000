class Computer < Player

  def move(board)
      return "#{(1..9).to_a.sample}"
  end

end