module Players
class Computer < Player

  def move(board, game = Game.new)
    input == 0
    if board.turn_count == 1
       board.valid_move?("5")
      player_1 = "5"

  elsif board.turn_count == 2
     board.valid_move?("1")
      player_2 = "1"

    elsif board.turn_count == 3
       board.valid_move?("3")
        player_1 = "3"
    elsif board.turn_count == 4
       board.valid_move?("7")
        player_2 = "7"
    elsif board.turn_count == 5
       board.valid_move?("9")
        player_1 = "9"
    elsif board.turn_count == 6
       board.valid_move?("6")
        player_2 = "6"
    elsif board.turn_count == 7
       board.valid_move?("4")
        player_1 = "4"
    elsif board.turn_count == 8
       board.valid_move?("2")
        player_2 = "2"
      elsif board.turn_count == 9
         board.valid_move?("8")
          player_1 = "8"
      else
      end


    randomGen = Random.new
    "#{randomGen.rand(9) +1}"

  if board.valid_move?(answer)
    while !board.valid_move?(answer)
      answer = random.Gen.rand(9) + 1
    end
  else
    answer
   end
  end
 end
end
