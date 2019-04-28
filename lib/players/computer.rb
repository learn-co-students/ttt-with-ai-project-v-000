module Players
  class Computer < Player
    WIN_COMBINATIONS = [
      [0,1,2],
      [3,4,5],
      [6,7,8],
      [0,3,6],
      [1,4,7],
      [2,5,8],
      [0,4,8],
      [2,4,6]
    ]

    def move(board)
      moves = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
      corners = ["1", "3", "7", "9"]
      middle_edge = ["2", "4", "6", "8"]
      
     if board.turn_count == 0
       corners.sample
     elsif !board.taken?("5")
       "5"
     elsif board.turn_count < 3
       corners.select {|i| !board.taken?(i)}.sample
     elsif WIN_COMBINATIONS.detect do |combo|
         tokens = combo.collect {|i| board.position(i + 1)}
         empty = tokens.count(" ")
         player_tokens = tokens.count(self.token)
         opp_tokens = 3 - tokens.count(self.token) - tokens.count(" ")
         if player_tokens == 2 && empty == 1
           combo.detect do |i|
             if board.position(i + 1) == " "
               place= i + 1
               return place.to_s
             end
           end
         end
       end
       elsif WIN_COMBINATIONS.detect do |combo|
           tokens = combo.collect {|i| board.position(i + 1)}
           empty = tokens.count(" ")
           player_tokens = tokens.count(self.token)
           opp_tokens = 3 - tokens.count(self.token) - tokens.count(" ")
           if opp_tokens == 2 && empty == 1
             combo.detect do |i|
               if board.position(i + 1) == " "
                 place= i + 1
                 return place.to_s
               end
             end
           end
         end
        elsif board.turn_count > 2
          if middle_edge.detect {|i| !board.taken?(i)}
            middle_edge.select {|i| !board.taken?(i)}.sample
          else
            moves.select {|i| !board.taken?(i)}.sample
          end
        end
      end
    end

  end
