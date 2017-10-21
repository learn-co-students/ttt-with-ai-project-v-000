class Player::Computer < Player

  def move(board)
    puts "Computer's move:"
  	if !board.taken?("1")
  	  "1"
  	elsif !board.taken?("8")
  	  "8"
  	elsif !board.taken?("6")
  	  "6"
  	elsif !board.taken?("5")
  	  "5"
  	elsif !board.taken?("2")
  	  "2"
  	else
  	  rand(1..9).to_s
  	end
  end


end