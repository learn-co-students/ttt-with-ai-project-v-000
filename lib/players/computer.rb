class Computer < Player

  def move(board)
    valid_position = nil
    (1..9).each do |position|
      if !board.taken?(position)
        valid_position = position.to_s
      end
    end
    return valid_position
  end
end
