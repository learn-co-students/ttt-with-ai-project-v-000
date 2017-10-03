module Players
  class Computer < Player

    attr_accessor :game, :board, :player, :token

    def initialize(token = nil)
      @token = token
    end

    def move(x)
       if x.valid_move?(index=rand(1..9))
         index.to_s
       else
         nil
       end
     end

  end
end
