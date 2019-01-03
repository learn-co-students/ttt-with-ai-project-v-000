module Players
  class Computer < Player
    attr_accessor :board, :moves_left
    @@moves = [] #index
    @@moves_left = [0,1,2,3,4,5,6,7,8]
    WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

    def move(board)
      @board = board
      if @token == "X"
         turn_x
      elsif @token == "O"
        turn_o
      end
    end

    def turn_number
      @board.cells.count{|x| x == @token}
    end

    def turn_x
      if turn_number == 0 #works
        @@moves.insert(0,@@moves_left[rand(0..8)])
        @@moves_left.delete(@@moves[0])
        (@@moves[0] + 1).to_s

      elsif turn_number == 1 #works
        @@moves.insert(1,@board.cells.index("O"))
        @@moves_left.delete(@@moves[1])

        possible = []
        WIN_COMBINATIONS.each do |x|
          possible << x.dup if x.include?(@@moves[0]) && x.include?(@@moves[1]) == false
        end

        x = possible[rand(0..(possible.length-1))]
        x.delete(@@moves[0])
        @@moves.insert(2,(x[rand(0..1)]))
        @@moves_left.delete(@@moves[2])
        (@@moves[2] + 1)

      elsif turn_number == 2 #working
        y = @board.cells.dup
        y[@@moves[1]] = " "
        @@moves.insert(3,y.index("O"))
        @@moves_left.delete(@@moves[3])

        possible = []
        WIN_COMBINATIONS.each do |x| #works
          possible = x if (x.include?(@@moves[0]) && (x.include?(@@moves[1]) == false) && x.include?(@@moves[2]) && (x.include?(@@moves[3]) == false))
        end

        if possible != [] #to win - works
          @@moves.insert(4, possible.select{|x| x!=@@moves[0] && x!=@@moves[2]}[0])
        elsif possible == [] #prevention - works
          prevent = []
          WIN_COMBINATIONS.each do |x|
             prevent = x if (x.include?(@@moves[1]) && x.include?(@@moves[3]) && (x.include?(@@moves[0])==false) && (x.include?(@@moves[2])==false))
          end
          @@moves.insert(4, prevent.select{|x| x!=@@moves[1] && x!=@@moves[3]}[0])
        end

        if @@moves[4] == nil #strategy - works
          strategy = []
          WIN_COMBINATIONS.each do |x|
            if ((x.include?(@@moves[1]) == false) && (x.include?(@@moves[3]) == false) && (x.include?(@@moves[0]) || x.include?(@@moves[2])))
              strategy << x
            end
          end
          strategy.flatten!
          @@moves.insert(4, strategy.select{|x| x!=@@moves[0] && x != @@moves[2]}[0])
        elsif @@moves[4] == nil #random - works
          @@moves.insert(4,@@moves_left[rand(0..4)])
        end

      @@moves_left.delete(@@moves[4])
      (@@moves[4] + 1)

    elsif turn_number == 3 #works (check random)
        yy = @board.cells.dup
        yy[@@moves[1]] = " "
        yy[@@moves[3]] = " "
        @@moves.insert(5,yy.index("O"))
        @@moves_left.delete(@@moves[5])

        possible_win = [] #works
        WIN_COMBINATIONS.each do |x|
          possible_win << x if ((x.include?(@@moves[1]) == false) && (x.include?(@@moves[3]) == false) && (x.include?(@@moves[5]) == false) && ((x.include?(@@moves[0]) && x.include?(@@moves[2])) || (x.include?(@@moves[0]) && x.include?(@@moves[4])) || (x.include?(@@moves[4]) && x.include?(@@moves[2]))))
        end

        possible_win.flatten!

        if possible_win != [] #win - works
          @@moves.insert(6, possible_win.select{|x| x!=@@moves[0] && x!=@@moves[2] && x!=@@moves[4]}[0])
        elsif possible_win == [] #prevent - working
          prevent = []
          WIN_COMBINATIONS.each do |x|
             prevent << x if (((x.include?(@@moves[1]) && x.include?(@@moves[3])) || (x.include?(@@moves[1]) && x.include?(@@moves[5])) || (x.include?(@@moves[5]) && x.include?(@@moves[3]))) && (x.include?(@@moves[0])==false) && (x.include?(@@moves[2])==false) && (x.include?(@@moves[4])==false))
          end
          prevent.flatten!
          @@moves.insert(6, prevent.select{|x| x!=@@moves[1] && x!=@@moves[3] && x!=@@moves[5]}[0])
        end

        if @@moves[6] == nil #strategy - works
            strategy = []
            WIN_COMBINATIONS.each do |x|
              strategy << x if ((x.include?(@@moves[1]) == false) && (x.include?(@@moves[3]) == false) && (x.include?(@@moves[5]) == false) && (x.include?(@@moves[0]) || x.include?(@@moves[2]) || x.include?(@@moves[4])))
            end

            strategy.flatten!
            @@moves.insert(6,strategy.select{|x| x != @@moves[0] && x != @@moves[2] && x != @@moves[4]}[0])

        elsif @@moves[6] == nil #random
          @@moves.insert(6,@@moves_left[rand(0..1)])
        end

        @@moves_left.delete(@@moves[6])
        (@@moves[6] + 1)

      elsif turn_number == 4
         yyy = @board.cells.dup
         yyy[@@moves[1]] = " "
         yyy[@@moves[3]] = " "
         yyy[@@moves[5]] = " "
         @@moves.insert(7,yyy.index("O"))
         @@moves_left.delete(@@moves[7])

         @@moves.insert(7,@@moves_left[0])
         @@moves_left.delete(@@moves[7])
         (@@moves[7] + 1)
       end
    end

    def turn_o
      if turn_number == 0
        @@moves.insert(0,@board.cells.index("X"))
        @@moves_left.delete(@@moves[0])

        @@moves.insert(1,@@moves_left[rand(0..7)])
        @@moves_left.delete(@@moves[1])
        (@@moves[1] + 1)

      elsif turn_number == 1
        y = @board.cells.dup
        y[@@moves[0]] = " "
        @@moves.insert(2,y.index("X"))
        @@moves_left.delete(@@moves[2])

        prevent = [] #prevention
        WIN_COMBINATIONS.each do |x|
           prevent = x if (x.include?(@@moves[0]) && x.include?(@@moves[2]) && (x.include?(@@moves[1])==false))
        end
        @@moves.insert(3, prevent.select{|x| x!=@@moves[0] && x!=@@moves[2]}[0])

        if @@moves[3] == nil #strategy
          strategy = []
          WIN_COMBINATIONS.each do |x|
            if ((x.include?(@@moves[0]) == false) && (x.include?(@@moves[2]) == false) && x.include?(@@moves[1]))
              strategy << x.select{|x| x != @@moves[1]}[0]
            end
          end
          @@moves.insert(3,strategy[rand(0..(strategy.length-1))])
        elsif @@moves[3] == nil #random - works
          @@moves.insert(3,@@moves_left[rand(0..4)])
        end

      @@moves_left.delete(@@moves[3])
      (@@moves[3] + 1)

      elsif turn_number == 2
        yy = @board.cells.dup
        yy[@@moves[0]] = " "
        yy[@@moves[2]] = " "
        @@moves.insert(4,yy.index("X"))
        @@moves_left.delete(@@moves[4])

        possible_win = []
        WIN_COMBINATIONS.each do |x|
          possible_win = x if ((x.include?(@@moves[0]) == false) && (x.include?(@@moves[2]) == false) && (x.include?(@@moves[4]) == false) && x.include?(@@moves[1]) && x.include?(@@moves[3]))
        end

        if possible_win != []
          @@moves.insert(5, possible_win.select{|x| x!=@@moves[1] && x!=@@moves[3]}[0])
        elsif possible_win == []
          prevent = []
          WIN_COMBINATIONS.each do |x|
             prevent << x if (((x.include?(@@moves[0]) && x.include?(@@moves[2])) || (x.include?(@@moves[0]) && x.include?(@@moves[4])) || (x.include?(@@moves[4]) && x.include?(@@moves[2]))) && (x.include?(@@moves[1])==false) && (x.include?(@@moves[3])==false))
          end
          prevent.flatten!
          @@moves.insert(5, prevent.select{|x| x!=@@moves[0] && x!=@@moves[2] && x!=@@moves[4]}[0])
        end

        if @@moves[5] == nil
          strategy = []
          WIN_COMBINATIONS.each do |x|
            strategy << x if ((x.include?(@@moves[0]) == false) && (x.include?(@@moves[2]) == false) && (x.include?(@@moves[4]) == false) && (x.include?(@@moves[1]) || x.include?(@@moves[3])))
          end

          strategy.flatten!
          @@moves.insert(5,strategy.select{|x| x != @@moves[1] && x != @@moves[3]}[0])

        elsif @@moves[5] == nil #random
          @@moves.insert(5,@@moves_left[rand(0..3)])
        end

        @@moves_left.delete(@@moves[5])
        (@@moves[5] + 1)

      elsif turn_number == 3
        yy = @board.cells.dup
        yy[@@moves[0]] = " "
        yy[@@moves[2]] = " "
        yy[@@moves[4]] = " "
        @@moves.insert(6,yy.index("X"))
        @@moves_left.delete(@@moves[6])

        possible_win = [] #works
        WIN_COMBINATIONS.each do |x|
          possible_win << x if ((x.include?(@@moves[0]) == false) && (x.include?(@@moves[2]) == false) && (x.include?(@@moves[4]) == false) && (x.include?(@@moves[6]) == false) && ((x.include?(@@moves[1]) && x.include?(@@moves[3])) || (x.include?(@@moves[1]) && x.include?(@@moves[5])) || (x.include?(@@moves[5]) && x.include?(@@moves[3]))))
        end

        possible_win.flatten!

        if possible_win != [] #win - works
          @@moves.insert(7, possible_win.select{|x| x!=@@moves[1] && x!=@@moves[3] && x!=@@moves[5]}[0])
        elsif possible_win == [] #prevent - working
          prevent = []
          WIN_COMBINATIONS.each do |x|
             prevent << x if (((x.include?(@@moves[0]) && x.include?(@@moves[2])) || (x.include?(@@moves[0]) && x.include?(@@moves[4])) || (x.include?(@@moves[2]) && x.include?(@@moves[4])) || (x.include?(@@moves[0]) && x.include?(@@moves[6])) || (x.include?(@@moves[2]) && x.include?(@@moves[6])) || (x.include?(@@moves[4]) && x.include?(@@moves[6])) ) && (x.include?(@@moves[1])==false) && (x.include?(@@moves[3])==false) && (x.include?(@@moves[5])==false))
          end
          prevent.flatten!
          @@moves.insert(7, prevent.select{|x| x!=@@moves[0] && x!=@@moves[2] && x!=@@moves[4] && x!=@@moves[6]}[0])
        end

        if @@moves[7] == nil #random
          @@moves.insert(7,@@moves_left[rand(0..1)])
        end

        @@moves_left.delete(@@moves[7])
        (@@moves[7] + 1)
      end
    end
  end
end
