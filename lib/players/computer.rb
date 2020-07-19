require 'pry'

module Players
  class Computer < Player

    WIN_COMBINATIONS = [
      [0,1,2],
      [3,4,5],
      [6,7,8],
      [0,3,6],
      [1,4,7],
      [2,5,8],
      [0,4,8],
      [2,4,6]
    ]

    def move(board)
      current = nil
      turn_two = [1,3,7,9]
      all_options = [1,2,3,4,5,6,7,8,9]
      case board.turn_count
      when 0
        "5"
      when 1
        current = turn_two[rand(4)]
        current.to_s
      when 2
        current = board.cells.index("O") + 1
        turn_three = turn_two
        turn_three.delete(current)
        turn_three.delete(10 - current)
        current = turn_three[rand(2)]
        current.to_s
      when 3..8
        close_to_winning = WIN_COMBINATIONS.detect do |combo|
          ((board.cells[combo[0]] == board.cells[combo[1]] && board.cells[combo[2]] == " ") ||
          (board.cells[combo[0]] == board.cells[combo[2]] && board.cells[combo[1]] == " ") ||
          (board.cells[combo[1]] == board.cells[combo[2]] && board.cells[combo[0]] == " ")) &&
          !(board.cells[combo[0]] == board.cells[combo[1]] && board.cells[combo[0]] == board.cells[combo[2]])
        end

        if close_to_winning
          win_blocker = close_to_winning.detect{|cell| board.cells[cell] == " "}
          next_move = win_blocker + 1
        elsif !close_to_winning
          all_options = []
          board.cells.each_with_index do |cell, index|
            all_options << (index + 1) if cell == " "
          end

          next_move = all_options[rand(all_options.length)]
        end
        next_move.to_s
      end
    end
  end
end
