module Players
   class Computer < Player

      attr_accessor :winning_combos

      WIN_COMBO = [
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
      board.display
      num = "5"
        if  board.valid_move?(num)
            board.valid_move?(num) ? num.to_s : move(board)
        elsif win_array_check(board)
              output = ""
              win_array_check(board).each do |num|
        if board.valid_move?(num+1) then output = (num+1).to_s end
        end
          output
        else
          corner_check(board)
          num = 1 + rand(9)
          board.valid_move?(num) ? num.to_s : move(board)
        end
      end

    def corner_check(board)
      corner = [0,2,6,8]
      corner.find do |num|
      board.cells[num] == " "
      (num+1).to_s
      end
    end

    def win_array_check(board)
     WIN_COMBO.find do |combo|
        (board.cells[combo[0]] == board.cells[combo[1]] || board.cells[combo[1]] == board.cells[combo[2]] || board.cells[combo[0]] == board.cells[combo[2]]) && ([board.cells[combo[0]], board.cells[combo[1]], board.cells[combo[2]]].select { |a| a == " "}.length == 1)
      end
    end
  end

end
