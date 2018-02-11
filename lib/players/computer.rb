# module Players
# class Computer < Player
#   def move(board)
#     if board.turn_count == 0 #for its first turn if AI goes first
#       "5"
#     elsif  board.turn_count == 1 #for its first turn if opponent goes first
#       if !board.taken?("5")
#         "5"
#       elsif
#         ["1","3","7","9"].sample
#       end
#     end
#     if board.turn_count == 2 #second turn if AI goes first
#       ["1","3","7","9"].detect {|x| !board.taken?(x)} #one thats not taken
#     elsif board.turn_count == 3 && board[4] == "O"#second turn if opponent goes first and not middle
#       if board.taken?("1") && board.taken?("3")
#         "2"
#       elsif board.taken?("1") && board.taken?("7")
#         "4"
#       elsif board.taken?("3") && board.taken?("9")
#         "6"
#       elsif board.taken?("7") && board.taken?("9")
#         "8"
#       elsif board.taken?("1") && board.taken?("2")
#         "3"
#       elsif board.taken?("2") && board.taken?("3")
#         "1"
#       elsif board.taken?("1")&& board.taken?("4")
#         "7"
#       elsif board.taken?("4") && board.taken?("7")
#         "1"
#       elsif board.taken?("7") && board.taken?("8")
#         "9"
#       elsif board.taken?("8") && board.taken?("9")
#         "7"
#       elsif board.taken?("3") && board.taken?("6")
#         "9"
#       elsif board.taken?("6") && board.taken?("9")
#         "3"
#       end
#     elsif board.turn_count == 3 && board[4] == "X" #second turn if opponent goes first and plays middle
#       if board[0] == "X"
#         "9"
#       elsif board[2] == "X"
#         "7"
#       elsif board[6] == "X"
#         "3"
#       elsif board[8]== "X"
#         "1"
#       elsif board[1]== "X"
#         "8"
#       elsif board[3]== "X"
#         "6"
#       elsif board[5] == "X"
#         "4"
#       elsif board[7]== "X"
#         "2"
#       end
#     end
#
#
#     if board.turn_count == 4 #third move if AI starts
#       if board[0] == "X" && !board.taken?("9")
#       "9"
#       elsif board[2] == "X" && !board.taken?("7")
#       "7"
#       elsif board[6] == "X" && !board.taken?("3")
#       "3"
#       elsif board[8] == "X" && !board.taken?("1")
#       "1"
#       elsif board.taken?("1") && board.taken?("3")
#         "2"
#       elsif board.taken?("1") && board.taken?("7")
#         "4"
#       elsif board.taken?("3") && board.taken?("9")
#         "6"
#       elsif board.taken?("7") && board.taken?("9")
#         "8"
#       elsif board.taken?("1") && board.taken?("2")
#         "3"
#       elsif board.taken?("2") && board.taken?("3")
#         "1"
#       elsif board.taken?("1")&& board.taken?("4")
#         "7"
#       elsif board.taken?("4") && board.taken?("7")
#         "1"
#       elsif board.taken?("7") && board.taken?("8")
#         "9"
#       elsif board.taken?("8") && board.taken?("9")
#         "7"
#       elsif board.taken?("3") && board.taken?("6")
#         "9"
#       elsif board.taken?("6") && board.taken?("9")
#         "3"
#       end
#
#     elsif board.turn_count == 5 && board[4] == "X" #if opponent startd and played middle
#       if board[0] == "O" && board[2] == "O"
#         "2"
#       elsif board[0] == "O" && board[6] == "O"
#         "4"
#       elsif board[2] == "O" && board[8] == "O"
#         "6"
#       elsif board[6] == "O" && board[8] == "O"
#         "8"
#
#
#     #NOW THE ONES IF OPPONENT PLAYED CORRECTLY
#       else
#       ["2","4","6","8"].detect {|x| !board.taken?(x)}
#       end
#     elsif board.turn_count == 5 && board[4] == "O" #third move if opponent starts and not middle
#       if board[1] == "O" && !board.taken?("8")#or if board.taken?("2")
#         "8"
#       elsif board[3]== "O" && !board.taken?("6")
#         "6"
#       elsif board[5] == "O" && !board.taken?("4")
#         "4"
#       elsif board[7] == "O" && !board.taken?("2")
#         "2"
#       elsif board [0] == "O" && !board.taken?("9")
#         "9"
#       elsif board [2] == "O" && !board.taken?("7")
#         "7"
#       elsif board [6] == "O" && !board.taken?("3")
#         "3"
#       elsif board [8] == "O" && !board.taken?("1")
#         "1"
#         #now if opponent played correctly
#       elsif board [1] == "O" || board [3] == "O" || board [5] == "O" || board [7] == "O"
#         ["2","4","6","8"].detect {|x| !board.taken?(x)}
#       elsif board [2] == "O"
#
#       elsif board [4] == "O"
#          board [6] == "O" || board [8] == "O"
#
#
#       end
#
#
#
#
#     end
#
#
#     #if human goes first, first computer move should be middle
#     #next move should be to be in between the 2 that are taken of the human player
#     #third move should be
#
#     #if player goes first,
#
#   end
# end
# end

module Players
 class Computer < Player

    def move(board)
      if board.turn_count == 0
       "5" #go to middle when board is empty
     elsif board.turn_count == 1 #if second player, first move: check if middle is occupied; if yes, go to corner cells.
      if !board.taken?("5")
         "5"
        else
          ["1","3","7","9"][rand(0..3)]
        end
      elsif board.turn_count == 2 #second move if AI went first (go to diagonal corner cell)
        ["1","3","7","9"].detect{|a|!board.taken?(a)} #occupy the corners whichever one was not occupied
      elsif board.turn_count == 3
        #second move when opponent went first: first check if opponent has a winning move, if yes, block; if no, then go for a winning move
        if (board.position("1") == board.position("9") || board.position("3") == board.position("7")) #if opponent occupied corners
          "5"
        elsif board.taken?("5") #check if the existing 2 moves by opponents is in the winning combo
          all_array = [0,1,2,3,4,5,6,7,8]
          current_position = all_array.select do |a|
            b=a+1
            board.taken?(b.to_s)
          end
          current_position = current_position.delete_if do |s| #current opponent's position index array
            b = s+1
            board.position(b.to_s) == token
          end
          o_cmb = Game::WIN_COMBINATIONS.detect {|cmb| current_position.to_set.subset?(cmb.to_set)} #opponent has 2 of the 3 winning positions - need to block
          if o_cmb != nil
            m = o_cmb.detect do |a|
              b = a+1
              !board.taken?(b.to_s)
            end
            m += 1
            m.to_s
          else
            move = ["1","3","7","9"].detect{|a|!board.taken?(a)}
          end
        end
      else # 4 moves and beyond: check if computer has winning move, if not, then check if opponent has winning move.
        all_array = [0,1,2,3,4,5,6,7,8]
        current_computer_array = all_array.select do |a| #array of occupied cells by computer
          a+=1
          board.position(a.to_s) == token
        end
        current_computer_array = current_computer_array.product(current_computer_array).delete_if {|array| array[0] == array [1]} #array of arrays
        current_opponent_array = all_array.select do |a|
          a+=1
          board.position(a.to_s) != token && board.taken?(a.to_s)
        end
        current_opponent_array = current_opponent_array.product(current_opponent_array).delete_if {|array| array[0] == array [1]}
        c_cmb = Game::WIN_COMBINATIONS.select do |cmb|
          current_computer_array.detect {|array| array.to_set.subset?(cmb.to_set)}
        end
        o_cmb = Game::WIN_COMBINATIONS.select do |cmb|
          current_opponent_array.detect {|array| array.to_set.subset?(cmb.to_set)}
        end
        if c_cmb != nil #first check if computer has winning chance
           c_win = c_cmb.detect do |c| #check if computer can win (is there a winning combo occupied that has vacant cells?)
             c.any? do |c1|
               c2 = c1 + 1
               !board.taken?(c2.to_s)
             end
           end
           if c_win != nil
             m = c_win.detect do |i|
               h= i +1
               !board.taken?(h.to_s)
             end
             m += 1
             m.to_s
          elsif o_cmb != nil
            o_win = o_cmb.detect do |o| #check if computer can win (is there a winning combo occupied that has vacant cells?)
              o.any? do |o1|
                o2 = o1 + 1
                !board.taken?(o2.to_s)
              end
            end
            if o_win != nil
              m = o_win.detect do |i|
                h= i +1
                !board.taken?(h.to_s)
              end
              m += 1
              m.to_s
            else
              un_array = all_array.select do |a|
                a+=1
                !board.taken?(a.to_s)
              end
              un_array[rand(un_array.length-1)]
            end
          else #if neither has winning move, occupy a random available cell and move on to next turn
            un_array = all_array.select do |a|
              a+=1
              !board.taken?(a.to_s)
            end
            un_array[rand(un_array.length-1)]
          end
        end
      end
    end
  end
end
