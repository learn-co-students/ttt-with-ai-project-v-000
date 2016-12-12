class Computer < Player
  def move(board)
    if board.cells == [" "," "," "," "," "," "," "," "," "] || board.cells == [" ","X"," "," "," "," "," "," "," "] || board.cells == [" "," "," ","X"," "," "," "," "," "] || board.cells == [" "," "," "," "," ","X"," "," "," "] || board.cells == [" "," "," "," "," "," "," ","X"," "]
      "5"
    elsif board.cells == [" "," "," "," ","X"," "," "," "," "]
      ["1","3","7","9"].sample
    elsif board.cells.count(" ") == 7
      if board.cells[0] != " " || board.cells[8] != " "
        ["3","7"].sample
      elsif board.cells[2] != " " || board.cells[6] != " "
        ["1","9"].sample
      elsif board.cells[1] != " "
        ["7","9"].sample
      elsif board.cells[3] != " "
        ["3","9"].sample
      elsif board.cells[5] != " "
        ["1","7"].sample
      elsif board.cells[7] != " "
        ["1","3"].sample
      end
    elsif board.cells.count(" ") == 6 && (board.cells[4] != " " && board.cells[1] != " " && board.cells[3] != " ")
        ["1","3", "7"].sample
    elsif board.cells.count(" ") == 6 && (board.cells[4] != " " && board.cells[1] != " " && board.cells[5] != " ")
        ["1","3", "9"].sample
    elsif board.cells.count(" ") == 6 && (board.cells[4] != " " && board.cells[3] != " " && board.cells[7] != " ")
        ["1","7", "9"].sample
    elsif board.cells.count(" ") == 6 && (board.cells[4] != " " && board.cells[5] != " " && board.cells[7] != " ")
        ["3","7", "9"].sample
    elsif winning_move(board) == "1" || winning_move(board) == "2" || winning_move(board) == "3" || winning_move(board) == "4" || winning_move(board) == "5" || winning_move(board) == "6" || winning_move(board) == "7" || winning_move(board) == "8" || winning_move(board) == "9"
      winning_move(board)
    else
      samp = ["1","2","3","4","5","6","7","8","9"].sample
      while board.valid_move?(samp) == false
        samp = ["1","2","3","4","5","6","7","8","9"].sample
      end
      return samp
    end
  end

  def winning_move(board)
    if @token == "X"
    win_combinations = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2]]
    winning_positionsx = []
    winning_positionso = []
    xes = []
    oes = []
    board.cells.each_with_index do|pos, index|
      if pos == "X"
        xes << index
      elsif pos == "O"
        oes << index
      end
    end
    win_combinations.each do|combo|
      i = 0
      xes.each do |pos|
        if combo.include?(pos)
          i += 1
        end
        if i == 2
            combo.each do |num|
                if xes.include?(num) == false
                    winning_positionsx << num
                end
            end
        end
      end
    end
    win_combinations.each do|combo|
      i = 0
      oes.each do |pos|
        if combo.include?(pos)
          i += 1
        end
        if i == 2
            combo.each do |num|
                if oes.include?(num) == false
                    winning_positionso << num
                end
            end
        end
      end
    end
    winstrsx = winning_positionsx.collect {|pos| (pos + 1).to_s}
    winstrso = winning_positionso.collect {|pos| (pos + 1).to_s}
    if winstrsx.detect {|pos| board.valid_move?(pos)} != nil
      winstrsx.detect {|pos| board.valid_move?(pos)}
    else
      winstrso.detect {|pos| board.valid_move?(pos)}
    end
    elsif @token == "O"
    win_combinations = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2]]
    winning_positionsx = []
    winning_positionso = []
    xes = []
    oes = []
    board.cells.each_with_index do|pos, index|
      if pos == "X"
        xes << index
      elsif pos == "O"
        oes << index
      end
    end
    win_combinations.each do|combo|
      i = 0
      xes.each do |pos|
        if combo.include?(pos)
          i += 1
        end
        if i == 2
            combo.each do |num|
                if xes.include?(num) == false
                    winning_positionsx << num
                end
            end
        end
      end
    end
    win_combinations.each do|combo|
      i = 0
      oes.each do |pos|
        if combo.include?(pos)
          i += 1
        end
        if i == 2
            combo.each do |num|
                if oes.include?(num) == false
                    winning_positionso << num
                end
            end
        end
      end
    end
    winstrsx = winning_positionsx.collect {|pos| (pos + 1).to_s}
    winstrso = winning_positionso.collect {|pos| (pos + 1).to_s}
    if winstrso.detect {|pos| board.valid_move?(pos)} != nil
      winstrso.detect {|pos| board.valid_move?(pos)}
    else
      winstrsx.detect {|pos| board.valid_move?(pos)}
    end
  end
  end

end