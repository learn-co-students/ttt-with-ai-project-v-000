class Player::Computer < Player

  WIN_COMBINATIONS =[
    [0,1,2],[3,4,5],[6,7,8], #HORIZONTAL WINNERS
    [0,3,6],[1,4,7],[2,5,8], #VERTICAL WINNERS
    [0,4,8],[2,4,6] #DIAGONAL WINNERS
  ]
  def move(board)

    opponent_wins = WIN_COMBINATIONS.find_all do |win|
      win.any? {|i| board.cells[i] != @token && board.cells[i] != " " }
    end
    my_blocks = WIN_COMBINATIONS.find_all do |win|
      win.any? {|i| board.cells[i] == @token }
    end
    pick = opponent_wins.find {|wins| my_blocks.include?(wins) == false}

    pick ? pick.find{|i| board.valid_move?(i + 1)}.+(1).to_s : "4"
  end
end
