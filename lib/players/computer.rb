require 'pry'

class Computer < Player
  attr_accessor :picked

  MAGIC_SQAURE = [8,1,6,  #Tic Tac Toe can be thought as a game of magic sqaure
                  3,5,7,  #couldnt implement this method
                  4,9,2]  #will play around with this in the future
  WIN_COMBINATIONS = [
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
    @token = token
    @picked =[1,2,3,4,6,7,8,9]  
  end

  def move(board)
    @picked =[1,2,3,4,6,7,8,9] 
    input = nil
    if @token == "X"
      char = "O"
    else
      char == "X"
    end

    #go through board to remove taken ones 
    board.each_with_index do |cell,index|
      if !(cell == " ")
        @picked.delete(index + 1)
      end
    end
    odds = @picked
    #get odds
    odds = odds.delete_if {|n| n.even? } 

    WIN_COMBINATIONS.each do |combo|
      position_1 = board[combo[0]]
      position_2 = board[combo[1]]
      position_3 = board[combo[2]]

      if !(position_1 == position_2 && position_2 == position_3)

        if ((position_1 == position_2 && position_1 != " ") || 
            (position_2 == position_3 && position_2 != " ") || 
            (position_1 == position_3 && position_1 != " "))

          if position_1 == " "
            @picked.delete(combo[0] + 1)
            return (combo[0] + 1)
          elsif position_2 == " "
            @picked.delete(combo[1] + 1)
            return (combo[1] + 1)
          elsif position_3 == " "
            @picked.delete(combo[2] + 1)
            return (combo[2] + 1)
          end  
        end
      end
    end

    if input == nil

      if (board[4] == " ")
        input = 5
      elsif (@picked.any? {|num| num.odd?})
        input = odds.sample
        @picked.delete(input)
      else
        i=0
        while i < board.length
          if board[i] == " "
            input = i + 1
            return (i + 1)
          end
          i += 1
        end
      end
    end
    # puts "IM CHOOSING #{input}"
    # puts "CHOICES FROM #{odds.to_s}"
    # puts "BOARD IS #{board.to_s}"
    return input
  end

end