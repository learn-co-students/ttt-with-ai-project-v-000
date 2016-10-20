module Players
  
  class Computer < Player
    
    def move(board)
      move = nil
      if board.turn_count == 0
        # binding.pry
        if !board.taken?(1)
          move = "1"
        end         
      elsif board.turn_count == 1
        if !board.taken?(5)
          move = "5"
        elsif !board.taken?(1)
          move = "1"
        elsif !board.taken?(3)
          move = "3"
        elsif !board.taken?(7)
          move = "7"
        elsif !board.taken?(9)
          move = "9"
        end
      else
        Game::WIN_COMBINATIONS.detect do |combo|
          if combo.select{|i| board.position(i+1) == token}.size == 2 && combo.any?{|i| board.position(i+1) == " "}
            move = combo.select{|i| !board.taken?(i+1)}.first.to_i.+(1).to_s
          elsif combo.select{|i| board.position(i+1) != " " && board.position(i+1) != token}.size == 2 && combo.any?{|i| board.position(i+1) == " "}
            move = combo.select{|i| !board.taken?(i+1)}.first.to_i.+(1).to_s
          end
        end
        move = [1, 3, 7, 9, 2, 4, 6, 8].detect{|i| !board.taken?(i)}.to_s if move == nil
      end
      move
    end
    

  end 
end