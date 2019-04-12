module Players
  class Computer < Player
    attr_accessor :win_possibilities, :loss_possibilities

    def move(board)
      return rand(1..9).to_s
    end 
  end 
end 
