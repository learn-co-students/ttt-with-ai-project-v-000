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
      if !board.taken?("5")
        move = "5"
      else
        rand(1..9)
      end
    end

    def corner(board)
      [0,2,6,8].detect{|cell| !board.taken?(cell+1)}
    end

    #def for_the_win
    #  WIN_COMBINATIONS.each do |ftw|
     #   ftw.board.position == X
    #end
  end
end