module Players
  class Computer < Player
    attr_accessor :input

    def move(board)
      #binding.pry
    index = [0,1,2,3,4,5,6,7,8]
    ##STRATEGY

    if board.valid_move?("5")
      @input = "5"
      return
    end

    index.each do
    |a| if board.valid_move?((a+1).to_s)
           if a == 0 || a==3 || a==6
             if !board.valid_move?((a+2).to_s) && self.token!=board.position((a+2).to_s)
                @input = (a+1).to_s
                return
             end
           end
        end
    end

    index.each do
    |a| if board.valid_move?((a+1).to_s)
           if a == 2 || a==5 || a==8
             if !board.valid_move?(a.to_s) && self.token!=board.position(a.to_s)
                @input = (a+1).to_s
                return
             end
           end
        end
    end

    if board.valid_move?("1")
      @input = "1"
    elsif  board.valid_move?("3")
      @input = "3"
    elsif  board.valid_move?("7")
      @input = "7"
    elsif  board.valid_move?("9")
      @input = "9"
    end


    index.each do
    |a| if board.valid_move?((a+1).to_s)
      #  binding.pry
        @input = (a+1).to_s

        end
    end

    end
  end
end
