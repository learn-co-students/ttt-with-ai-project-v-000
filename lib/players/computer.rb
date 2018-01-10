module Players
  class Computer < Player
    def move(board)
      input = nil

      #if you're going first, take one of the corner cells of the board.
    if board.turn_count == 0
      puts "First Move"
      input = [1,3,7,9].sample.to_s
      #If you went first, and the middle cell is not taken and the opponent has taken another cell, take another corner cell!
    elsif board.turn_count == 2 && !board.taken?(5)
      input = [1,3,7,9].detect{|i| !board.taken?(i)}.to_s
      #if you didn't go first, then you will have occupied the middle cell. If the human selects this combo, select a non corner cell. Combos: 1:9 || 3:7
    elsif board.turn_count == 3 && (board.position(1) == board.position(9) || board.position(3) == board.position(7))
      input = [2,4,6,8].detect{|i|!board.taken?(i)}.to_s

      #If you went first, you selected a corner cell
      #If the middle cell is not taken and the opponent has occupied another cell on turn 2
      #You will have occupied another corner cell on turn 3
      #You're lined up for a win. Check if it's still possible. If it is, go for it. If it isn't, go for the last corner cell and win it!
    elsif board.turn_count == 3 && !board.taken?(5)
      Game::WIN_COMBINATIONS.detect do |combo|
        if combo.select{|i|board.position(i+1) == token}.size == 2 && combo.any?{|i|board.position(i+1) == " "}
          input = combo.select{|i|board.position(i+1) == " "}.first.to_i.+(1).to_s
        else
          input = [1,3,7,9].detect{|i|!board.taken?(i)}.to_s
        end
      end
      #if you're not going first, check if the middle cell is taken, if it isn't, take it, if it is, occupy a corner cell.
    elsif board.turn_count == 1
      if !board.taken?(5)
      puts "I'm taking the middle cell because I didn't get to go first"
        input = "5"
      else
        puts "Since I didn't get to go first, and you took the middle cell, I will occupy a corner cell"
        input = [1,3,7,9].detect{|i| !board.taken?(i)}.to_s
      end
      #if you didn't go first, and the middle cell is taken, you will have occupied a corner cell. The human will now try to win. Block them. If not, occupy another corner cell.
    elsif board.turn_count == 3 && board.taken?(5)
      Game::WIN_COMBINATIONS.detect do |combo|
      if combo.select{|i|board.position(i+1) != token && board.position(i+1) != " "}.size == 2 && combo.any?{|i|board.position(i+1) == " "}
        input = combo.select{|i|!board.taken?(i+1)}.first.to_i.+(1).to_s
      else
        input = [1,3,7,9].detect{|i|!board.taken?(i)}.to_s
      end
    end
      #If you've gotten this far, then it means your human isn't very smart. Make the next move your winning move.
    elsif board.turn_count == 4
      Game::WIN_COMBINATIONS.detect do |combo|
        if combo.select{|i|board.position(i+1) == token}.size == 2 && combo.any?{|i|board.position(i+1) == " "}
          input = combo.select{|i|board.position(i+1) == " "}.first.to_i.+(1).to_s
        else
          if combo.select{|i|board.position(i+1) != token && board.position(i+1) != " "}.size == 2 && combo.any?{|i|board.position(i+1) == " "}
            input = combo.select{|i|!board.taken?(i+1)}.first.to_i.+(1).to_s
          end
        end
      end
    elsif board.turn_count == 5
      Game::WIN_COMBINATIONS.detect do |combo|
        if combo.select{|i|board.position(i+1) == token}.size == 2 && combo.any?{|i|board.position(i+1) == " "}
          input = combo.select{|i|board.position(i+1) == " "}.first.to_i.+(1).to_s
        end
      end
      Game::WIN_COMBINATIONS.detect do |combo|
        if combo.select{|i|board.position(i+1) != token && board.position(i+1) != " "}.size == 2 && combo.any?{|i|board.position(i+1) == " "}
          puts "I'm making the wrong move, fix me!"
          input = combo.select{|i|!board.taken?(i+1)}.first.to_i.+(1).to_s
        end
      end
      Game::WIN_COMBINATIONS.detect do |combo|
        if input == nil
          puts "I'm making the ultimate worse move ever, fix me!"
          input = [1,2,3,4,5,6,7,8,9].detect{|i|!board.taken?(i)}.to_s
        end
      end
  elsif board.turn_count == 7
    Game::WIN_COMBINATIONS.detect do |combo|
      if combo.select{|i|board.position(i+1) == token}.size == 2 && combo.any?{|i|board.position(i+1) == " "}
        input = combo.select{|i|board.position(i+1) == " "}.first.to_i.+(1).to_s
      end
      if combo.select{|i|board.position(i+1) != token && board.position(i+1) != " "}.size == 2 && combo.any?{|i|board.position(i+1) == " "}
        input = combo.select{|i|!board.taken?(i+1)}.first.to_i.+(1).to_s
      end
      if input == nil
        input = [1,2,3,4,5,6,7,8,9].detect{|i|!board.taken?(i)}.to_s
      end
    end
    else input = [1,2,3,4,5,6,7,8,9].detect{|i|!board.taken?(i)}.to_s
    end
    input
    end
  end
end
