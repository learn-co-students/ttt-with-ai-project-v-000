module Players
class Computer < Player

  def move(board)
    #input == 0
    if board.turn_count == 0
       board.valid_move?("5")
      "5"

  elsif board.turn_count == 1
     board.valid_move?("1")
      "1"

    elsif board.turn_count == 2
       board.valid_move?("3")
        "3"
    elsif board.turn_count == 3
       board.valid_move?("7")
        "7"
    elsif board.turn_count == 4
       board.valid_move?("9")
        "9"
    elsif board.turn_count == 5
       board.valid_move?("6")
        "6"
    elsif board.turn_count == 6
       board.valid_move?("4")
        "4"
    elsif board.turn_count == 7
       board.valid_move?("2")
        "2"
      elsif board.turn_count == 8
         board.valid_move?("8")
          "8"
      else
      end


    #randomGen = Random.new
    #{}"#{randomGen.rand(9) +1}"

  #if board.valid_move?(answer)
    #while !board.valid_move?(answer)
      #answer = random.Gen.rand(9) + 1
    #end
  #else
    #answer
   end
  end
 end
