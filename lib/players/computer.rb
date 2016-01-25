class Player::Computer < Player

  def opponent
    token == "X" ? @opponent = "O" : @opponent = "X"
  end 

  def move(board)
    Game::WIN_COMBINATIONS.each do |pos| 
      if board.cells[pos[0]] == opponent && board.cells[pos[1]] == opponent
        location = board.cells[pos[2]+1].to_s
        if !board.taken?(location)
          return location
        end
      elsif board.cells[pos[1]] == opponent && board.cells[pos[2]] == opponent
        location = board.cells[pos[0]+1].to_s
        if !board.taken?(location)
          return location
        end
      elsif board.cells[pos[2]] == opponent && board.cells[pos[0]] == opponent
        location = board.cells[pos[1]+1].to_s
        if !board.taken?(location)
          return location
        end
end
    end

return rand(1..9).to_s

end

end

