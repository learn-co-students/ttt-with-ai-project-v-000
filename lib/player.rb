class Player

      WIN_COMBINATIONS_PLAYER = [
        [1,2,3], [4,5,6],[7,8,9],
        [1,5,9], [3,5,7],
        [1,4,7], [2,5,8], [3,6,9]
      ]
  attr_accessor :board
  attr_reader :token

  def initialize(token)
    @token = token
  end

end
