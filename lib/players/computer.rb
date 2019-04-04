module Players
  class Computer < Player
    attr_accessor :board, :game

     
   def move(board) 
      return rand(1..9).to_s
  end
end
end