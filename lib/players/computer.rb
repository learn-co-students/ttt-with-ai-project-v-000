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
