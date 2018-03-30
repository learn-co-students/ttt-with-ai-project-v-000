require 'pry'
module Players
  class Computer < Player
    attr_accessor :move_array, :token


    def initialize(token)
      @token = token
      @move_array = [2,4,6,8,1,3,5,7,9]
    end


    def move(board)
      selection = @move_array.find { |number| number } #!= @@last_selection }
      @move_array.delete(selection) #ensures cpu will not select same move again
      "#{selection}"  #quotes messed me up for a long time ! Replicates a user's input, not just a return value.
    end

  end #class end
end #module end
