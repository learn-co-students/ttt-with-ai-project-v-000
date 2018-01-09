module Players
  class Computer < Player
    def move(board)
      move = nil

      if !board.taken?(5)
        move = "5"
      elsif board.turn_count == 1
        move = "1"
      elsif board.turn_count == 2
        move = [1,3,7,9].detect{|i|!board.taken?(i)}.to_s
      elsif board.turn_count == 3 && (board.position(1) == board.position(9) || board.position(3) == board.position(7))
        move == "2"
      else
         Game::WIN_COMBINATIONS.detect do |combo|
           #go through each of the winning combos.
           #if there are atleast two tokens that are the same AND there is an empty slot, make that your next move.
           #move equals an array that has an empty string. Then take the first value of the array, turn it into an integer, add 1 and turn it back to a string.
           if combo.select{|i| board.position(i+1) == token}.size == 2 && combo.any?{|i| board.position(i+1) == " "}
            move = combo.select{|i| !board.taken?(i+1)}.first.to_i.+(1).to_s
          #if you can make any winning moves, sabotage the human player by blocking their wins.
          #go through each combo and and see if each cell is not equal to your token and if it's not equal to your token make sure it's also not an empty space. Since an empty space is also not equal to your token, you have to put these two conditions together. Last but not least, if there are a total of two, make your move equal to the empty space.
        elsif combo.select{|i| board.position(i+1) != " " && board.position(i+1) != token}.size == 2 && combo.any?{|i|board.position(i+1) == " "}
            move = combo.select{|i| !board.taken?(i+1)}.first.to_i.+(1).to_s
        end
      end

        move = [1, 3, 7, 9, 2, 4, 6, 8].detect{|i| !board.taken?(i)}.to_s if move == nil
      end
      move
    end
  end
end
