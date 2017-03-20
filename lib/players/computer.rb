module Players
  class Computer < Player

    attr_accessor :token

    def initialize(token)
      @token = token
    end

      WIN_COMBINATIONS = [
      [0,1,2],
      [3,4,5],
      [6,7,8],
      [0,3,6],
      [1,4,7],
      [2,5,8],
      [0,4,8],
      [6,4,2]
      ]

    def move(board)

      opponent_token = ""
      if self.token == "X"
        opponent_token = "O"
      else
        opponent_token = "X"
        self.token == "O"
      end

      if(board.valid_move?("5"))
        move = "5"
      elsif board.turn_count == 1
        move = "1"
      elsif board.turn_count == 2
        move = [1, 3, 7, 9].shuffle.detect{|i| !board.taken?(i)}.to_s

      else

        WIN_COMBINATIONS.detect do |combo|
          if combo.select{|i| board.position(i+1) == self.token}.size == 2 && 
             combo.any?{|i| board.position(i+1) == " "}
             move = combo.select{|i| !board.taken?(i+1)}.first.to_i.+(1).to_s
                
        elsif combo.select{|i| board.position(i+1) == opponent_token}.size == 2 && 
              combo.any?{|i| board.position(i+1) == " "}
              move = combo.select{|i| !board.taken?(i+1)}.first.to_i.+(1).to_s
                
            end
          end
            
        move = [1, 3, 7, 9, 2, 4, 6, 8].shuffle.detect{|i| !board.taken?(i)}.to_s if move == nil
      end
      move



                





      
    end
      
  end
end