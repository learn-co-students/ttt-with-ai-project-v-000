class Player::AI < Player

  def ai_move(board)

=begin
    1. if turn_count < 3, checks for open center spot (board[4])
      --if that's filled, checks array of corner spaces [0, 2, 6, 8]
        for a valid spot, at random (adapt current computer move)




=end
    def danger_zone?(board)
      WIN_COMBINATIONS.select{|a| 
        a.select{|i| board[i]=="X"}.size==1
      }
    end

    def 


  end




end