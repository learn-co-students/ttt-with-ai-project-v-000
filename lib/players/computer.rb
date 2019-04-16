module Players
  class Computer < Player
    
    WIN_COMBINATIONS = [
    [0, 1, 2], [3, 4, 5], [6, 7, 8],
    [0, 3, 6], [1, 4, 7], [2, 5, 8],
    [0, 4, 8], [2, 4, 6]
  ]
    
    def move(board)
      moves = get_moves(board)
      if board.cells[4] == " "
        move = 4
      elsif part_won?(board)
        move = complete(board)
      else
        move = moves.sample
      end
      move += 1
      move.to_s
    end
    
    def get_moves(board)
      moves = board.cells.map.with_index{|x, i| i if x == " "}
      moves = moves.select {|m| m != nil}
    end
    
    def part_won?(board)
      WIN_COMBINATIONS.detect do |combo|
        (board.cells[combo[0]] == board.cells[combo[1]] && !board.taken?(combo[2]+1)) ||
        (board.cells[combo[1]] == board.cells[combo[2]] && !board.taken?(combo[0]+1)) ||
        (board.cells[combo[0]] == board.cells[combo[2]] && !board.taken?(combo[1]+1))
      end
    end
    
    def complete(board)
      combo = part_won?(board)
      combo.detect{|index| !board.taken?(index+1)}
    end
    
  end
end