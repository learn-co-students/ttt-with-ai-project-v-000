module Players
  class Computer < Player
    def move(board)
      input = nil

      #if you're going first, take one of the corner cells of the board.
    if board.turn_count == 0
      puts "First Move! I'll take a corner cell to make things interesting."
      input = [1,3,7,9].sample.to_s

      #if you're not going first, check if the middle cell is taken, if it isn't, take it, if it is, occupy a corner cell.
    elsif board.turn_count == 1
      if !board.taken?(5)
      puts "I'm taking the middle cell because I didn't get to go first."
        input = "5"
      else
        puts "Since I didn't get to go first, and you took the middle cell, I will occupy a corner cell."
        input = [1,3,7,9].detect{|i| !board.taken?(i)}.to_s
      end

      #If you went first, and the middle cell is not taken and the opponent has taken another cell, take another corner cell!
    elsif board.turn_count == 2 && !board.taken?(5)
      puts "I see that we're ignoring the middle cell! I guess I'll have to trap you!"
      input = [1,3,7,9].detect{|i| !board.taken?(i)}.to_s


      #If the human goes first and the middle cell is not their first choice, then you will have occupied the middle cell.
      #Check if the human's second turn matches the combos 1:9 || 3:7, if so, block this trap by selecting a non-corner cell if not, select a corner cell as your next move.
    elsif board.turn_count == 3
      if (board.position(1) == board.position(9) && board.position(1) != " ") || (board.position(3) == board.position(7) && board.position(3) != " ")
        puts "You can't trap the great ALICE! hahahah"
        input = [2,4,6,8].detect{|i|!board.taken?(i)}.to_s
      elsif (board.position(1) != board.position(9) && board.taken?(1) && board.taken?(9))
        puts "Selecting a corner cell to avoid being trapped."
        input = [1,3,7,9].detect{|i| !board.taken?(i)}.to_s
      elsif (board.position(3) != board.position(7) && board.taken?(3) && board.taken?(7))
        puts "Selecting another corner cell....."
        input = [1,3,7,9].detect{|i| !board.taken?(i)}.to_s
      else
        Game::WIN_COMBINATIONS.detect do |combo|
        if combo.select{|i|board.position(i+1) != token && board.position(i+1) != " "}.size == 2 && combo.any?{|i|board.position(i+1) == " "}
          puts "I'm making a move to block you."
          input = combo.select{|i|!board.taken?(i+1)}.first.to_i.+(1).to_s
          end
        end
        end


    elsif board.turn_count == 4
      Game::WIN_COMBINATIONS.detect do |combo|
        if combo.select{|i|board.position(i+1) == token}.size == 2 && combo.any?{|i|board.position(i+1) == " "}
          input = combo.select{|i|board.position(i+1) == " "}.first.to_i.+(1).to_s
        end
      end
      if input == nil
        Game::WIN_COMBINATIONS.detect do |combo|
          if combo.select{|i|board.position(i+1) != token && board.position(i+1) != " "}.size == 2 && combo.any?{|i|board.position(i+1) == " "}
          input = combo.select{|i|!board.taken?(i+1)}.first.to_i.+(1).to_s
          end
        end
      end
      if input == nil
        input = [1,2,3,4,5,6,7,8,9].detect{|i|!board.taken?(i)}.to_s
      end


    elsif board.turn_count == 5
      Game::WIN_COMBINATIONS.detect do |combo|
        if combo.select{|i|board.position(i+1) == token}.size == 2 && combo.any?{|i|board.position(i+1) == " "}
          input = combo.select{|i|board.position(i+1) == " "}.first.to_i.+(1).to_s
        end
      end
      if input == nil
        Game::WIN_COMBINATIONS.detect do |combo|
          if combo.select{|i|board.position(i+1) != token && board.position(i+1) != " "}.size == 2 && combo.any?{|i|board.position(i+1) == " "}
          input = combo.select{|i|!board.taken?(i+1)}.first.to_i.+(1).to_s
          end
        end
      end
      if input == nil
        input = [1,3,7,9].detect{|i|!board.taken?(i)}.to_s
        end


  elsif  board.turn_count == 6
    Game::WIN_COMBINATIONS.detect do |combo|
      if combo.select{|i|board.position(i+1) == token}.size == 2 && combo.any?{|i|board.position(i+1) == " "}
          input = combo.select{|i|board.position(i+1) == " "}.first.to_i.+(1).to_s
      end
    end
      if input == nil
        Game::WIN_COMBINATIONS.detect do |combo|
          if combo.select{|i|board.position(i+1) != token && board.position(i+1) != " "}.size == 2 && combo.any?{|i|board.position(i+1) == " "}
            puts "turn 6 fix me."
            input = combo.select{|i|!board.taken?(i+1)}.first.to_i.+(1).to_s
          end
        end
      end
      if input == nil
        input = [1,2,3,4,5,6,7,8,9].detect{|i|!board.taken?(i)}.to_s
      end


  elsif board.turn_count == 7
    Game::WIN_COMBINATIONS.detect do |combo|
      if combo.select{|i|board.position(i+1) == token}.size == 2 && combo.any?{|i|board.position(i+1) == " "}
        input = combo.select{|i|board.position(i+1) == " "}.first.to_i.+(1).to_s
      end
    end
    if input == nil
    Game::WIN_COMBINATIONS.detect do |combo|
      if combo.select{|i|board.position(i+1) != token && board.position(i+1) != " "}.size == 2 && combo.any?{|i|board.position(i+1) == " "}
        input = combo.select{|i|!board.taken?(i+1)}.first.to_i.+(1).to_s
        end
      end
    end
    if input == nil
      input = [1,2,3,4,5,6,7,8,9].detect{|i|!board.taken?(i)}.to_s
    end


    else input = [1,2,3,4,5,6,7,8,9].detect{|i|!board.taken?(i)}.to_s
    end
    input
    end
  end
end
