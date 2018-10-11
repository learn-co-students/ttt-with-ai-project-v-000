module Players
  class Computer < Player
    require 'pry'
    def move(board)
      # move = nil
      if !board.taken?(5) #Computer will choose center space #5 if open
        move = "5"
      elsif board.turn_count == 1 #Otherwise computer will choose space #7 corner (Computer went second)
        move = "7"
      elsif board.turn_count == 2 #Computer will first open corner if it chose the center space (Computer went first)
        move = [1, 3, 7, 9].find {|i| !board.taken?(i)}
      elsif board.turn_count == 3 #Computer will play defense 
        opponent_move = [1, 2, 3, 4, 6, 7, 8, 9].find {|i| board.taken?(i)} #Figure out where opponent is to make defensive move
        if opponent_move == 1 
          move = 9
        elsif opponent_move == 9
          move = 1
        elsif opponent_move == 2
          move = 8
        elsif opponent_move == 8
          move = 2
        elsif opponent_move == 4
          move = 6
        elsif opponent_move == 6
          move = 4
        else #move into corner
          move = [1, 3, 7, 9].find {|i| !board.taken?(i)} 
        end
      else
        Game::WIN_COMBINATIONS.find do |combo|

          # Check WIN_COMBINATIONS if Computer can win
          if combo.select{|i| board.position(i+1) == token}.size == 2 && combo.any?{|i| board.position(i+1) == " "}
            move = combo.select{|i| !board.taken?(i+1)}.first.to_i.+(1).to_s

          # Computer will play defense, continuing to check WIN_COMBINATIONS
          elsif combo.select{|i| board.position(i+1) != " " && board.position(i+1) != token}.size == 2 && combo.any?{|i| board.position(i+1) == " "}
            move = combo.select{|i| !board.taken?(i+1)}.first.to_i.+(1).to_s
          end
        end
          #Otherwise make a move anywhere
        move = rand(1..9)
      end
      move
    end
  end
end