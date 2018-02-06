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
        current_computer_array = all_array.select do |a|
          a+=1
          board.position(a.to_s) == token
        end
        current_opponent_array = all_array.select do |a|
          a+=1
          board.position(a.to_s) != token && board.taken?(a.to_s)
        end
        c_cmb = Game::WIN_COMBINATIONS.detect {|cmb| current_computer_array.to_set.subset?(cmb.to_set)} #first check if computer has winning chance
        o_cmb = Game::WIN_COMBINATIONS.select {|cmb| current_opponent_array.to_set.subset?(cmb.to_set)} #second check if opponent has winning chance, if yes then block
        if c_cmb != nil #if computer winning combo is occupied
          t_1 = c_cmb.any? do |c| #check if computer can win (is there unoccupied cells in the winning combo?)
            d = c+1
            !board.taken?(d.to_s)
          end
          if t_1 #if there is, make winning move
            m = c_cmb.detect do |i|
              h= i +1
              !board.taken?(h.to_s)
            end
            m += 1
            m.to_s
          elsif o_cmb != nil #if there isn't, check if opponent has winning move
            t_2 = o_cmb.any? do |o|
              p = o + 1
              !board.taken?(p.to_s)
            end
            if t_2 #block opponent winning move
              m = o_cmb.detect do |i|
                h = i+1
                !board.taken?(h.to_s)
              end
              m += 1
              m.to_s
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
