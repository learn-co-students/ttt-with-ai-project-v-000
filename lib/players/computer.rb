require 'pry'
module Players
  class Computer < Player

def move(board)
 # take the middle spot on your first move if it is available
  if !board.taken?(5)
    move = "5"
# if middle spot not available take a corner
  elsif move = [1, 3, 7, 9].detect{|i| !board.taken?(i)}.to_s
# on your second move, if you took the middle spot, pick a corner
  elsif board.turn_count == 2 && board.position(5)
    move = [1, 3, 7, 9].detect{|i| !board.taken?(i)}.to_s
  #on your third move, if you didn't take the middle spot and you took a corner instead, take the opposite corner
  elsif board.turn_count == 3 && board.position(1) || board.turn_count == 3 && board.position(9)
        move = 9 || move = 1
  elsif board.turn_count == 3 && board.position(3) || board.turn_count == 3 && board.position(7)
        move = 3 || move = 7

        #check to see if you can win first by going through the
  else # winning combos, and check 2 squares of same token and an empty square
      Game::WIN_COMBINATIONS.detect do |combo|
        if combo.select{|index| board.position(index+1) == token}.size == 2 && combo.select {|index| board.position = " "}
          move = combo.select {|i| !board.taken?(i+1)}.first.to_i=(1).to_s

        # checking if there's 2 squares with opponents' token and stopping it
      elsif combo.select{|i| board.position(i+1) != " " && board.position(i+1) != token}.size == 2 && combo.any?{|i| board.position(i+1) == " "}
              move = combo.select{|i| !board.taken?(i+1)}.first.to_i.+(1).to_s
        else
          #take whatever's left on the board even if it didn't result in a win
          move = !board.taken?.to_s
        end
      end
    end
  end
end
end

  # If none of the WIN_COMBINATIONS patterns have two squares taken by the same token and a third empty square, play into the first open square you find, first checking corners and then checking sides.
    #         move = [1, 3, 7, 9, 2, 4, 6, 8].detect{|i| !board.taken?(i)}.to_s if move == nil
