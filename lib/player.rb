class Player
   attr_reader :token

   #defines a token property that defaults to X
   #token is set at initialization
   def initialize(token = "X")
     @token = token
   end
 end
