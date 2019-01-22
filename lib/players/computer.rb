module Players
  class Computer < Player

attr_accessor :progression

def initialize(token)
  super
  @progression = []
end

def playout(board)
  index = 1
     until index == 9
       if !board.taken?("#{index}")
         return "#{index}"
       end
     index +=1
   end
end



    def move(board)

      if board.turn_count < 2
        if !board.taken?("1")
          self.progression << 1
          return "1"
        else
          self.progression << 3
          return "3"
        end
      end
      #grab the opposite corner or block the other from trying
      if board.turn_count == 2 || board.turn_count == 3
         if @progression[0] == 1
           if !board.taken?("9")
             @progression << 9
             return "9"
           elsif board.taken?("7")
             @progression << 8
             return "8"
           elsif board.taken?("3")
             @progression << 6
             return "6"
           else
          @progression << 7
          return "7"
        end
      elsif !board.taken?("7")
        @progression << 7
        return "7"
      else
        @progression << 4
        return "4"
      end
      end
      #round 3
      if board.turn_count == 4 || board.turn_count == 5
       if @progression[0] == 1 && @progression[1] == 9
          if !board.taken?("5")
          return "5"


        elsif !board.taken?("3")
          @progression << 3
          return "3"


        elsif !board.taken?("7")
          @progression << 7
          return "7"

          end

      elsif @progression[0] == 1 && @progression[1] == 7
        if !board.taken?("4")
          return "4"


        else
        self.playout(board)
        end


      elsif @progression[0] == 1 && @progression[1] == 3
        if !board.taken?("2")
          return "2"


        else
        self.playout(board)
        end


      elsif @progression[0] == 3 && @progression[1] == 7
        if !board.taken?("5")
        return "5"


      elsif !board.taken?("9")
        @progression << 9
        return "9"
        end


     else self.playout(board)
     end
     end

#round 4
if board.turn_count == 6 || board.turn_count == 7
 if @progression[0] == 1 && @progression[1] == 9 && @progression[2] == 3
   if !board.taken?("2")
     return "2"


   elsif !board.taken?("6")
     return "6"


   else self.playout(board)
   end


 elsif @progression[0] == 1 && @progression[1] == 9 && @progression[2] == 7
   if !board.taken?("4")
     return "4"

   elsif !board.taken?("8")
     return "8"

   else self.playout(board)
   end

   else self.playout(board)
   end
 end

self.playout(board)

end
end
end
