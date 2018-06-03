module Players
  class Computer < Player
    attr_accessor :avail_spots, :moves, :opp_moves

    MY_WIN_COMBINATIONS=[
      [0,1,2],
      [3,4,5],
      [6,7,8],
      [0,3,6],
      [1,4,7],
      [2,5,8],
      [0,4,8],
      [6,4,2]
    ]

    def initialize(token)
      super
      @avail_spots=[1,2,3,4,5,6,7,8,9]
      @moves=[]
      @opp_moves=[]
    end

    def move(board)
      self.update(board)
      if @avail_spots.include?(5)
        move="5"
      else
        move=@avail_spots.sample.to_s
      end
      move
    end


    def update(board)
      @avail_spots=[]
      board.cells.each_with_index do |pos,ind|
        if pos==" "
          @avail_spots<<ind+1
        end
      end
    end

    def opp_token
      if self.token=="X"
        "O"
      else
        "X"
      end
    end

  end
end
