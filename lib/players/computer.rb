module Players
  class Computer < Player
    def move(board)
      move = nil
      ##opening moves for 2 computers, or for if computer is playing a human and is either player_1 or player_2
      #might be easier to focus on one player and their strategy at a time:
      #player_1 will always be going on the even number turn_counts, since turn_count is 0 when they make their first move
      if !board.taken?('5')
          "5"
          #player_2 has to worry about turn_count == 1, so they have two options, 5 if it's not taken, otherwise 1.
        elsif board.turn_count == 1
          "1"
        elsif board.turn_count == 3 && (board.position(1) == board.position(9)  || board.position(3) == board.position(7)) #human setting trap
          "2" #spring_trap
        else
          next_move(board) + 1
      end
    end
    
    def next_move(board)
      win(board) || block(board) || corner(board) || dead_spot
    end

    def win(board)
      winning_combo = complete_combo?(board, self.token)
      if winning_combo && winning_combo.count{|index| board.position(index+1) == self.token} == 2
        winning_combo.detect{|index| !board.taken?(index+1)}
      end
    end
    def block(board)
      blocking_combo = complete_combo?(board, self.opponents_token)
      if blocking_combo && blocking_combo.count{|index| board.position(index + 1) == self.opponents_token} == 2
        blocking_combo.detect{|index| !board.taken?(index+1)}
      end
    end

    def corner(board)
      [0,2,6,8].detect{|cell| !board.taken?(cell + 1)}
    end

    def dead_spot
      (0..8).to_a.sample
    end
  #WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
def complete_combo?(board, token)
  Game::WIN_COMBINATIONS.detect do |combo|
    (
    (board.cells[combo[0]] == token && board.cells[combo[1]] == token) && !board.taken?(combo[2] + 1)
    ) ||
    (
    (board.cells[combo[0]] == token && board.cells[combo[2]] == token) && !board.taken?(combo[1] + 1)
    ) ||
    (
    (board.cells[combo[1]] == token && board.cells[combo[2]] == token) && !board.taken?(combo[0] + 1)
    )
  end
end

def opponents_token
  self.token == "X" ? "O" : "X"
end





     #elsif board.turn_count == 2
      #  move = [1,3,7,9].detect{|cell| !board.taken?(cell)}.to_s
    #elsif board.turn_count == 3 && (board.position(1) == board.position(9)  || board.position(3) == board.position(7)) #human setting trap
  #      move = "2" #spring_trap
#      elsif board.turn_count == 3
#        move = [1,3,7,9].detect{|cell| !board.taken?(cell)}.to_s
#      else
#        move = (0..8).to_a.sample



#bin/tictactoe
        ##now I need blockers and win_combo attempts

  #    end #end of big ass conditional
#    end #end of def
  end
end
#


#Game::WIN_COMBINATIONS.detect do |combo|


#  if combo.select{|i| board.position(i+1) == token}.size == 2 && combo.any?{|i| board.position(i+1) == " "}
#    move = combo.select{|i| !board.taken?(i+1)}.first.to_i.+(1).to_s
#  elsif combo.select{|i| board.position(i+1) != " " && board.position(i+1) != "X"}.size == 2 && combo.any?{|i| board.position(i+1) == " "}
#    move = combo.select{|i| !board.taken?(i+1)}.first.to_i.+(1).to_s
#  end
#end

  #    else
  #      Game::WIN_COMBINATIONS.detect do |combo_wombos|
  #        if combo_wombos.select{|i| board.position(i+1) == token}.size == 2 && combo_wombo.any?{|i| board.position(i+1) == " "}
  #          move = combo_wombos.select{|i| !board.taken?(i+1).first.to_i.+(1).to_s}
  #        elsif combo_wombos.select{|i| board.position(i+1) != " " && board.position(i+1) != token}.size == 2 && combo_wombos.any?{|i| board.position(i+1) == " "}
  #          move = combo_wombos.select{|i| !board.taken?(i+1).first.to_i.+(1).to_s}
  #        end
  #      end
  #      move = [1,2,3,4,5,6,7,8,9].detect{|i| !board.taken(i)}.to_s if move == nil
  #    end #end of big ass conditional
#    end #end of def
#  end
#end
#
#>>>>>>> 30088ebbd6c8f4f4563a0e94346f3cc1b6a43208
"Ok fucking aweseome i just lost ALL of my pseudo code writing that I had worked on for the last two hours
but don't worry a lot of it was repetitive and got you toward a final step tree, from what I can remember it looked like this:

rules:
always go for middle first, then go for a corner
if human sets a trap, be ready with code for spring_trap
always block first


computer is player_1
1. middle
2. corner
3. block, complete win_combo, corner that has blank space between move 2. and itself
4. complete win_combo, go towards win_combo
5. block, fill in dead spot

computer is player_2
1. middle if not taken or corner
2. block, spring_trap, or corner
3. block, or complete win_combo
4. block, fill in dead spot, go towards win_combo, complete win_combo


two computers as player_1 and player_2 should always draw:
1. middle
2. corner
3. corner
4. block or corner
5. block
6. block
7. go towards win_combo
8. block
9. dead spot or block


to do list:
<<<<<<< HEAD
  3. figure out the conditional of 0, 1, or 2 players for the bin.???
=======
  1. implement all of my lost pseudo code that you generally know how it works
  2. why is my draw 'cat's game' on an infinite loop?
  3. figure out the conditional of 0, 1, or 2 players for the bin.
>>>>>>> 30088ebbd6c8f4f4563a0e94346f3cc1b6a43208

  God that pissed me off but I feel better now.


"
[" ", "X", " ", " ", "X", " ", " ", " ", " "]
