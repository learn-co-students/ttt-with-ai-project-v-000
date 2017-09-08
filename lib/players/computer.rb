require 'pry'
module Players
  class Computer < Player

    def move(board)
      win_combinations = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
      #binding.pry
    #  move = nil
      #  win_combinations.each do |win|
      #    if board.taken?(win[0]) && board.cells[win[0]] == board.cells[win[1]] && !board.taken?(win[2])
      #      move = win[2]
      #    elsif board.taken?(win[0]) && board.cells[win[0]] == board.cells[win[2]] && !board.taken?(win[1])
      #      move = win[1]
      #    elsif board.taken?(win[1]) && board.cells[win[1]] == board.cells[win[2]] && !board.taken?(win[0])
      #      move = win[0]
      #    end
      #  end
      #  binding.pry

      if win_combinations.any? do |win|
          (board.taken?(win[0]) && board.cells[win[0]] == board.cells[win[1]] && !board.taken?(win[2])) ||
          (board.taken?(win[0]) && board.cells[win[0]] == board.cells[win[2]] && !board.taken?(win[1])) ||
          (board.taken?(win[1]) && board.cells[win[1]] == board.cells[win[2]] && !board.taken?(win[0]))
        end
        move = move.detect {|cell| !board.taken?(cell)}
      elsif !board.taken?(5)
          move = 5
      elsif [0, 2, 6, 8].any? {|cell| !board.taken?(cell)}
          move = [0, 2, 6, 8].detect {|cell| !board.taken?(cell)}
      else
        move = board.cells.detect {|cell| !board.taken?(cell)}
      end
      move
    end

  end
end
