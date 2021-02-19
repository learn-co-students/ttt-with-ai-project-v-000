class Players::Computer < Player

  def move(board)
    move = nil
		if board.turn_count == 0
      move = [1,3,7,9].sample.to_s
  #  elsif board.turn_count == 1 && [1,3,7,9].all?{|cell| !board.taken?(cell.to_s)}
  #    move = [1,3,7,9].sample.to_s
elsif board.turn_count == 1 && board.taken?("5")
			move = [1,3,7,9].sample.to_s
    elsif board.turn_count >= 1 && board.turn_count < 6 && !board.taken?("5")
      move = "5"
  #  elsif board.turn_count == 2 && board.taken?("5") && [1,3,7,9].all?{|cell| !board.taken?(cell.to_s)}
	 #		move = [1,3,7,9].sample.to_s
 elsif board.turn_count == 2 && board.turn_count < 6 && board.taken?("5") && ([1,3,7,9].select{|cell| board.position("#{cell}") == self.token})
      if board.position("1") == self.token
        move = [3,7].sample
      elsif board.position("3") == self.token
        move = [1,9].sample
      elsif board.position("7") == self.token
        move = [1,9].sample
      elsif board.position("9") == self.token
        move = [3,7].sample
      end
    elsif (board.turn_count > 2 && board.turn_count < 6 && ((board.position("1") != " " && board.position("2") != " " && board.position("1") == board.position("2") && !board.taken?("3")) || (board.position("2") != " " && board.position("3") != " " && board.position("2") == board.position("3") && !board.taken?("1")) || (board.position("4") != " " && board.position("5") != " " && board.position("4") == board.position("5") && !board.taken?("6")) || (board.position("5") != " " && board.position("6") != " " && board.position("5") == board.position("6") && !board.taken?("4")) || (board.position("7") != " " && board.position("8") != " " && board.position("7") == board.position("8") && !board.taken?("9")) || (board.position("8") != " " && board.position("9") != " " && board.position("8") == board.position("9") && !board.taken?("7")) || (board.position("1") != " " && board.position("4") != " " && board.position("1") == board.position("4") && !board.taken?("7")) || (board.position("4") != " " && board.position("7") != " " && board.position("4") == board.position("7") && !board.taken?("1")) || (board.position("2") != " " && board.position("5") != " " && board.position("2") == board.position("5") && !board.taken?("8")) || (board.position("5") != " " && board.position("8") != " " && board.position("5") == board.position("8") && !board.taken?("2")) || (board.position("3") != " " && board.position("6") != " " && board.position("3") == board.position("6") && !board.taken?("9")) || (board.position("6") != " " && board.position("9") != " " && board.position("6") == board.position("9") && !board.taken?("3")) || (board.position("1") != " " && board.position("5") != " " && board.position("1") == board.position("5") && !board.taken?("9")) || (board.position("5") != " " && board.position("9") != " " && board.position("5") == board.position("9") && !board.taken?("1")) || (board.position("7") != " " && board.position("5") != " " && board.position("7") == board.position("5") && !board.taken?("3")) || (board.position("5") != " " && board.position("3") != " " && board.position("5") == board.position("3") && !board.taken?("7")))) || (board.turn_count > 3 && board.turn_count < 7 && ((board.position("1") != " " && board.position("3") != " " && board.position("1") == board.position("3") && !board.taken?("2")) || (board.position("7") != " " && board.position("9") != " " && board.position("7") == board.position("9") && !board.taken?("8")) || (board.position("1") != " " && board.position("7") != " " && board.position("1") == board.position("7") && !board.taken?("4")) || (board.position("3") != " " && board.position("9") != " " && board.position("3") == board.position("9") && !board.taken?("6"))))
      if board.position("1") != " " && board.position("2") != " " && board.position("1") == board.position("2") && !board.taken?("3")
        move = "3"
      elsif board.position("2") != " " && board.position("3") != " " && board.position("2") == board.position("3") && !board.taken?("1")
        move = "1"
      elsif board.position("4") != " " && board.position("5") != " " && board.position("4") == board.position("5") && !board.taken?("6")
        move = "6"
      elsif board.position("5") != " " && board.position("6") != " " && board.position("5") == board.position("6") && !board.taken?("4")
        move = "4"
      elsif board.position("7") != " " && board.position("8") != " " && board.position("7") == board.position("8") && !board.taken?("9")
        move = "9"
      elsif board.position("8") != " " && board.position("9") != " " && board.position("8") == board.position("9") && !board.taken?("7")
        move = "7"
      elsif board.position("1") != " " && board.position("4") != " " && board.position("1") == board.position("4") && !board.taken?("7")
        move = "7"
      elsif board.position("4") != " " && board.position("7") != " " && board.position("4") == board.position("7") && !board.taken?("1")
        move = "1"
      elsif board.position("2") != " " && board.position("5") != " " && board.position("2") == board.position("5") && !board.taken?("8")
        move = "8"
      elsif board.position("5") != " " && board.position("8") != " " && board.position("5") == board.position("8") && !board.taken?("2")
        move = "2"
      elsif board.position("3") != " " && board.position("6") != " " && board.position("3") == board.position("6") && !board.taken?("9")
        move = "9"
      elsif board.position("6") != " " && board.position("9") != " " && board.position("6") == board.position("9") && !board.taken?("3")
        move = "3"
      elsif board.position("1") != " " && board.position("5") != " " && board.position("1") == board.position("5") && !board.taken?("9")
        move = "9"
      elsif board.position("5") != " " && board.position("9") != " " && board.position("5") == board.position("9") && !board.taken?("1")
        move = "1"
      elsif board.position("7") != " " && board.position("5") != " " && board.position("7") == board.position("5") && !board.taken?("3")
        move = "3"
      elsif board.position("5") != " " && board.position("3") != " " && board.position("5") == board.position("3") && !board.taken?("7")
        move = "7"
      elsif board.position("1") != " " && board.position("3") != " " && board.position("1") == board.position("3") && !board.taken?("2")
        move = "2"
      elsif board.position("1") != " " && board.position("7") != " " && board.position("1") == board.position("7") && !board.taken?("4")
        move = "4"
      elsif board.position("3") != " " && board.position("9") != " " && board.position("3") == board.position("9") && !board.taken?("6")
        move = "6"
      elsif board.position("9") != " " && board.position("7") != " " && board.position("9") == board.position("7") && !board.taken?("8")
        move = "8"
      end
#    elsif board.turn_count > 3 && board.turn_count < 7 && ((board.position("1") != " " && board.position("3") != " " && board.position("1") == board.position("3") && !board.taken?("2")) || (board.position("7") != " " && board.position("9") != " " && board.position("7") == board.position("9") && !board.taken?("8")) || (board.position("1") != " " && board.position("7") != " " && board.position("1") == board.position("7") && !board.taken?("4")) || (board.position("3") != " " && board.position("9") != " " && board.position("3") == board.position("9") && !board.taken?("6")))
#      if board.position("1") != " " && board.position("3") != " " && board.position("1") == board.position("3") && !board.taken?("2")
#        move = "2"
#      elsif board.position("1") != " " && board.position("7") != " " && board.position("1") == board.position("7") && !board.taken?("4")
#        move = "4"
#      elsif board.position("3") != " " && board.position("9") != " " && board.position("3") == board.position("9") && !board.taken?("6")
#        move = "6"
#      elsif board.position("9") != " " && board.position("7") != " " && board.position("9") == board.position("7") && !board.taken?("8")
#        move = "8"
#      end
    elsif board.turn_count > 2 && board.turn_count < 6 && board.position("5") == self.token && [1,3,7,9].none?{|cell| board.position("#{cell}") == self.token}
        move = [1,3,7,9].detect{|cell| !board.taken?("#{cell}")}.to_s
    elsif board.turn_count > 2 && board.turn_count < 6 && board.position("5") == self.token && ((board.position("1") == self.token && !board.taken?("9")) || (board.position("3") == self.token && !board.taken?("7")) || (board.position("7") == self.token && !board.taken?("3")) || (board.position("9") == self.token && !board.taken?("1")))
      if board.position("1") == self.token && !board.taken?("9")
        move = "9"
      elsif board.position("3") == self.token && !board.taken?("7")
        move = "7"
      elsif board.position("7") == self.token && !board.taken?("3")
        move = "3"
      elsif board.position("9") == self.token && !board.taken?("1")
        move = "1"
      end
  #  elsif board.turn_count >= 3
    else
      move = [1,2,3,4,5,6,7,8,9].detect{|cell| board.taken?(cell.to_s) == false}.to_s
		end
    move
	end

end
