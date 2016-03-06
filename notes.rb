




##########################################
#########   THE WALL   solution!!  #################
  def turn
   
    choice = current_player.move(board)
    if board.valid_move?(choice)
      board.update(choice, current_player)
    else
      turn
    end
  end 
##########################################
    def play
      while !over? && !won? && !draw?
        turn
      end
      if draw?
        puts "Cats Game!"
      elsif won?
          puts "Congratulations #{winner}!"
      else
      end
    end
end
##########################################
##########################################
lsof -wni tcp:3000

kill -9 PID


##########################################
##########   52 and 4    #################
#########   THE WALL     #################
  def turn
    choice = current_player.move(board)
    if board.valid_move?(choice)
      board.update(choice, current_player)
    end
  end 
##########################################
    def play
      if !over? && !won? && !draw?
        turn
      if draw?
        puts "Cats Game!"
      if won?
          puts "Congratulations #{winner}!"
        else    
          end
        end
      end
    end
end

##########################################
#########  52 and 6    ###################
#########   THE WALL     #################
  def turn
   
    choice = current_player.move(board)
    if board.valid_move?(choice)
      board.update(choice, current_player)
    else
      turn
    end
  end 
##########################################
    def play
      while !over?
        turn
      end
      if draw?
        puts "Cats Game!"
      elsif won?
          puts "Congratulations #{winner}!"
      else
      end
    end
end

##########################################
##########  52 and 7     #################
#########   THE WALL     #################
  def turn
    choice = current_player.move(board)
    if board.valid_move?(choice)
      board.update(choice, current_player)
    else
      turn
    end
  end 
##########################################
    def play
      while !over?
        turn
      end
    # puts "Please enter a valid move 1-9:"
    # input = gets.to_s.strip
    # player_1.move(input?)
    if draw?
        puts "Cats Game!"
      elsif won?
          puts "Congratulations #{winner}!"
      else
     

      end
    end
end


##########################################
##########################################
#########   52 and 8     #################
#########   THE WALL     #################
  def turn
    choice = current_player.move(board)
    if board.valid_move?(choice)
      board.update(choice, current_player)
    else
      turn
    end
  end 
##########################################
    def play
      if draw?
        puts "Cats Game!"
      elsif won?
          puts "Congratulations #{winner}!"
      else
      end
    end
##########################################)
##########################################
##########################################
    # def turn
    #   player_1.move(input)
    #   # if valid_move?(input)
    #   #   player_2.move(input)
    #   # else player_1.move(input) until valid_move?(input)
    #   #   player_2.move(input)
    #   # end
    # end


    # def turn
    #   player_1.move(input)
    #     if board.valid_move?(input) == false;
    #       puts "invalid move"
    #   player_2.move(input)
    #     if board.valid_move?(input) == false;
    #       puts "invalid move"
    #   player_1.move(input)
    #     if board.valid_move?(input) == false;
    #       puts "invalid move"
    #       end
    #     end
    #   end
    # end
##########################################
##########################################
##  attempt at human.move#######
    puts "Please input your choice 1-9:"
    input = gets.to_s.strip
    until board.valid_move?(input)
      puts "invalid move"
      puts "Please input your choice 1-9:"
        input = gets.to_s.strip
    end
    input
  end
##########################################
#############  52 and 9 ##################
  def turn
    player_1.move(input)
     if board.valid_move?(input) == false;
       puts "invalid move"
     else
       board.update(input, player_1)
       board.display
      end
    end
  
    def play
          
        if over? || won?
          end
        if won?
          puts "Congratulations #{winner}!"
        elsif draw?
          puts "Cats Game!"
        else
      end
    end
end
##########################################
##########################################

##########################################
##########################################


    def turn
     player = current_player
     current_move = player.move(@board)
     if !@board.valid_move?(current_move)
       turn
     else
       player.display
       @board.update(current_move, player)
       @board.display
      end
    end
  
    def play
        until over?
          turn
        end
        if won?
          puts "Congratulations #{winner}!"
        else draw?
          puts "Cats Game!"
        end
    end
end


##########################################
#### 52 examples, 11 failures ############
  def turn
    player_1.move(input)
   #    if valid_move?(input) != true; 
   #      puts "invalid move"
   # player_2.move(input)
   # if valid_move?(input) != true; 
   #      puts "invalid move"
   #    end
  end
##########################################
  def check
    won? || draw?
  end
##########################################
  def play

    
    check
    if won?
      puts "Congratulations #{board.cells[won?[0]]}!";
      end
    if draw?
      puts "Cats Game!"
      end
    player_2.move(input)
      input = gets.to_s.strip
     # end
  end
end 

##########################################
##########################################


##########################################
##############   52 and 11  ##############

  def turn
    player_1.move(input)
    # if board.valid_move?(input) != true; 
    #   puts "WTF...enter a valid_move, please!"
    # else player_2.move(input)
    #  end
  end

  def play
    case player_1.move(input)
       
    when over? || won?
      turn
    end
      if won?
        puts "Congratulations #{board.cells[won?[0]]}!"
      elsif draw?
        puts "Cats Game!"
      end
    else
    player_2.move(input)
      input = gets.to_s.strip
    end

end 



  # turn
  #   makes valid moves
  #   asks for input again after a failed validation (FAILED - 1)
  #   changes to player 2 after the first turn (FAILED - 2)
  # play
  #   asks for players input on a turn of the game
  #   checks if the game is over after every turn (FAILED - 3)
  #   plays the first turn of the game (FAILED - 4)
  #   plays the first few turns of the game (FAILED - 5)
  #   checks if the game is won after every turn
  #   checks if the game is draw after every turn (FAILED - 6)
  #   stops playing if someone has won (FAILED - 7)
  #   congratulates the winner X (FAILED - 8)
  #   congratulates the winner O (FAILED - 9)
  #   stops playing in a draw (FAILED - 10)
  #   prints "Cats Game!" on a draw (FAILED - 11)
  #   plays through an entire game (FAILED - 12)










