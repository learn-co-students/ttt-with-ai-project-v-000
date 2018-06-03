module Players
  class Computer < Player
    WIN_COMBINATIONS = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    
    def move(board)
      remaining_moves = board.cells.map.with_index {|cell, index| index + 1 if cell == " "}
      
      move1 = WIN_COMBINATIONS.detect do |combo|
        board.cells[combo[0]] == board.cells[combo[1]] && board.cells[combo[2]] == " " && board.cells[combo[0]] != " "
      end
      
      move2 = WIN_COMBINATIONS.detect do |combo|
        board.cells[combo[1]] == board.cells[combo[2]] && board.cells[combo[0]] == " " && board.cells[combo[1]] != " "
      end
      
      move3 = WIN_COMBINATIONS.detect do |combo|
        board.cells[combo[0]] == board.cells[combo[2]] && board.cells[combo[1]] == " " && board.cells[combo[0]] != " "
      end
      
      if move1 && remaining_moves.include?(move1[2]+1)
        action = move1[2] + 1
      elsif move2 && remaining_moves.include?(move2[0]+1)
        action = move2[0] + 1
      elsif move3 && remaining_moves.include?(move3[1]+1)
        action = move3[1] + 1
      else
        remaining_moves.sample.to_s
      end
      
    end
    
  end
end