module Players
  class Computer < Player

    def move(board)
  #    if (board.cells[0] == "X") && (board.cells[2] == "X")
  #    puts "The computer's move: 2"
  #    2
  #    elsif (board.cells[1] == "X") && (board.cells[2] == "X")
  #    puts "The computer's move: 1"
  #    1
  #    elsif (board.cells[0] == "X") && (board.cells[1] == "X")
  #    puts "The computer's move: 3"
  #    3
  #    elsif (board.cells[3] == "X") && (board.cells[4] == "X")
  #    puts "The computer's move: 6"
  #    6
  #    elsif (board.cells[3] == "X") && (board.cells[5] == "X")
  #    puts "The computer's move: 5"
  #    5
  #    elsif (board.cells[4] == "X") && (board.cells[5] == "X")
  #    puts "The computer's move: 4"
  #    4
  #    elsif (board.cells[6] == "X") && (board.cells[7] == "X")
  #    puts "The computer's move: 9"
  #    9
  #    elsif (board.cells[6] == "X") && (board.cells[8] == "X")
  #    puts "The computer's move: 8"
  #    8
  #    elsif (board.cells[7] == "X") && (board.cells[8] == "X")
  #    puts "The computer's move: 7"
  #    7
  #    elsif (board.cells[0] == "X") && (board.cells[3] == "X")
  #    puts "The computer's move: 7"
  #    7
  #    elsif (board.cells[0] == "X") && (board.cells[6] == "X")
  #    puts "The computer's move: 4"
  #    4
  #    elsif (board.cells[3] == "X") && (board.cells[6] == "X")
  #    puts "The computer's move: 1"
  #    1
  #    elsif (board.cells[1] == "X") && (board.cells[4] == "X")
  #    puts "The computer's move: 8"
  #    8
  #    elsif (board.cells[4] == "X") && (board.cells[7] == "X")
  #    puts "The computer's move: 2"
  #    2
  #    elsif (board.cells[1] == "X") && (board.cells[7] == "X")
  #    puts "The computer's move: 5"
  #    5
  #    elsif (board.cells[2] == "X") && (board.cells[5] == "X")
  #    puts "The computer's move: 9"
  #    9
  #    elsif (board.cells[5] == "X") && (board.cells[8] == "X")
  #    puts "The computer's move: 3"
  #    3
  #    elsif (board.cells[2] == "X") && (board.cells[8] == "X")
  #    puts "The computer's move: 6"
  #    6
  #    elsif (board.cells[0] == "X") && (board.cells[4] == "X")
  #    puts "The computer's move: 9"
  #    9
  #    elsif (board.cells[0] == "X") && (board.cells[8] == "X")
  #    puts "The computer's move: 5"
  #    5
  #    elsif (board.cells[4] == "X") && (board.cells[8] == "X")
  #    puts "The computer's move: 1"
  #    1
  #    elsif (board.cells[2] == "X") && (board.cells[4] == "X")
  #    puts "The computer's move: 7"
#      7
  #  elsif (board.cells[4] == "X") && (board.cells[6] == "X")
  #    puts "The computer's move: 3"
  #    3
  #    elsif (board.cells[2] == "X") && (board.cells[6] == "X")
  #    puts "The computer's move: 5"
  #    5
  #  elsif (board.cells[1] == " ")
  #    puts "The computer's move: 1"
  #    1
  #  elsif (board.cells[3] == " ")
  #    puts "The computer's move: 3"
  #    3
  #  elsif (board.cells[7] == " ")
  #    puts "The computer's move: 7"
  #    7
  #  elsif (board.cells[9] == " ")
  #    puts "The computer's move: 9"
    #  9
    #end

      num = rand(1..9)
      if board.taken?(num) == false
        puts "The computer's move: #{num}"
        return num.to_s
      else
        move(board)
      end
    end
  end
end
