class Computer < Player

  attr_accessor :token, :my_spaces, :opponent_token, :opponent_spaces

  WIN_COMBINATIONS = [
      [1,2,3],
      [4,5,6],
      [7,8,9],
      [1,4,7],
      [2,5,8],
      [3,6,9],
      [1,5,9],
      [3,5,7]
    ]

  def initialize(token = "X")
    @token = token
    if token == "X"
      @opponent_token = "O"
    else
      @opponent_token = "X"
    end
    @my_spaces = []
  end

  def move(board)
    #--------FIRST TURN--------#
    if board.turn_count == 0 || board.turn_count == 1 #if this is the first time the computer has moved
    puts "First turn.."
      move = [1,3,5,7,9].sample #selects either the corners or the center to play
      while board.taken?(move)
        move = [1,3,5,7,9].sample
      end
        #sends move index back to game.turn
      puts move.to_s
        return move.to_s
    end
    #--------SECOND TURN--------#
    if board.turn_count == 2
      puts "Second turn..."
      #Chooses spaces that are adjacent to first move
      get_my_spaces(board)
      last_move = 0
      #finds the space played in the first turn
      self.my_spaces.each do |space|
        last_move = space if space != " "
      end
      case last_move
        when 1
          move = [2,4].sample
          #checks if position is already taken
          while board.taken?(move)
            move = [2,4].sample
          end
        puts move.to_s
          return move.to_s
        when 3
          move = [2,6].sample
          #checks if position is already taken
          while board.taken?(move)
             move = [2,6].sample
          end
        puts move.to_s
        return move.to_s
        when 5
          move = [2,4,6,8].sample
          #checks if position is already taken
          while board.taken?(move)
            move = [2,4,6,8].sample
          end
        puts move.to_s
        return move.to_s
        when 7
          move = [4,8].sample
          #checks if position is already taken
          while board.taken?(move)
            move = [4,8].sample
          end
        puts move.to_s
        return move.to_s
        when 9
          move = [6,8].sample
          #checks if position is already taken
          while board.taken?(move)
            move = [6,8].sample
          end
        puts move.to_s
        return move.to_s
      end
    end
    #--------ALL OTHER TURNS--------#
    if board.turn_count >= 3
      puts "All other turns..."
      where_to_play?(board)
    end
  end



  def where_to_play?(board)
    puts "WHERE TO PLAY..."
      get_opponent_spaces(board)
      get_my_spaces(board)
    #----------------------TESTS IF IT HAS AN OPENING TO WIN------------------------
    puts "Testing for win opening..."
    puts "I occupy: #{self.my_spaces}"
    WIN_COMBINATIONS.each do |win_combination|
      puts "Testing against: #{win_combination}"
      if (win_combination & self.my_spaces).length == 2
        win_combination.each do |space|
          puts "Testing individual space: #{space}"
          if !(board.taken?(space))
            puts "Found open space: #{space}"
            if board.valid_move?(space)
              puts space.to_s
              return space.to_s
            end
          end
        end
      end
    end
    #----------------------TESTS IF IT NEEDS TO DEFEND------------------------
    #Collects spaces occupied by opponent
    puts "No win openings, testing if I need to defend..."
    #@opponent_spaces is 1-9, since update.board subracts 1
    puts "Opponent occupies: #{self.opponent_spaces}"
    WIN_COMBINATIONS.each do |win_combination|
      puts "Testing against: #{win_combination}"
      if (win_combination & self.opponent_spaces).length == 2
        win_combination.each do |space|
          puts "Testing individual space: #{space}"
          if !(board.taken?(space))
            puts "Found open space: #{space}"
            if board.valid_move?(space)
              puts space.to_s
              return space.to_s
            end
          end
        end
      end
    end
    #----------------------OTHERWISE JUST PLAYS RANDOMLY------------------------
    puts "No chance to win, nowhere to defend, playing random spot..."
    space = [1,2,3,4,5,6,7,8,9].sample
      puts space.to_s
      return space.to_s
  end


  def get_opponent_spaces (board)
    puts "Collecting opponent spaces..."
    self.opponent_spaces = board.cells.each_index.collect do |index|
      if board.cells[index] == self.opponent_token
        index+1
      else
        " "
      end
    end
  end

  def get_my_spaces(board)
    puts "Collecting my spaces..."
    self.my_spaces = board.cells.each_index.collect do |index|
      if board.cells[index] == self.token
        index+1
      else
        " "
      end
    end
  end


  ##FIRST DRAFT

#  def where_to_defend?(board)
#    #Collects spaces occupied by opponent
#    opponent_spaces = board.cells.each_index.select {|index| board.position(index) == self.other_player_token}
#    #Compares opponent spaces to win combinations, to see if a win is possible
#    POTENTIAL_WIN_COMBINATIONS.each do |win_combination|
#    puts "searching win combos"
#      #Checks if the opponent has 2 out of 3 spaces in a win combination
#      if (win_combination & opponent_spaces).length == 2
#        print self.my_spaces
#        puts "win combo has 2/3 opponent tokens"
#        #saves the win_combination that needs to be defended
#        print win_combination
#        self.defense_combination = win_combination
#      else
#        #RETURN ANY OPEN SPOT
#      end
#    end
#  end



#  def defend(board)
#    puts "DEFENDING"
#    move = nil
#    #Finds the space in the win combination that's blank
#    self.defense_combination.each do |space|
#      puts space
#      if !(board.taken?(space))
#        move = space
#        self.my_spaces << move-1
#      end
#    end
#    #plays in that space
#    puts "RETURNING #{move.to_s}"
#    return move.to_s
#  end



end