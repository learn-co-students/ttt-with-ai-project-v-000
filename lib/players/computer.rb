class Computer < Player

  def move(board)

    #try to go in the center
    if !board.taken?(5)
      5
    else
      #else check to see if any of the winning combinations need to be blocked or completed

      Game::WIN_COMBINATIONS.map do |combo|
        if board.cells[combo[0]]==board.cells[combo[1]] && board.cells[combo[0]] != " " && board.cells[combo[2]] == " "
          return (combo[2]+1)
        elsif board.cells[combo[1]]==board.cells[combo[2]] && board.cells[combo[1]] != " " && board.cells[combo[0]] == " "
          return (combo[0]+1)
        elsif board.cells[combo[0]]==board.cells[combo[2]] && board.cells[combo[0]] != " " && board.cells[combo[1]] == " "
          return (combo[1]+1)
        end
      end
      #else find a corner
      if !board.taken?(1)
        1
      elsif !board.taken?(3)
        3
      elsif !board.taken?(7)
        7
      elsif !board.taken?(9)
        9
      elsif !board.taken?(2)
        2
      elsif !board.taken?(4)
        4
      elsif !board.taken?(6)
        6
      elsif !board.taken?(8)
        8
      elsif !board.taken?(9)
        9
      end
    end
  end
end
