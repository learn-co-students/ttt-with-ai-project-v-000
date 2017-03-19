module Players
  class Computer < Player
    def move(board)
      if board.turn_count<=1
        first_move(board)
      else
        defense(board)
      end
    end

    def first_move(board) #takes center or corner position based on availability
      if board.valid_move?("5")
        "5"
      else
        for i in 0..board.cells.length - 1
          return (i + 1).to_s if board.cells[i] == " " && i % 2 == 0
        end
      end
    end

    def defense(board)
      cells = board.cells
      cells.each_with_index do |c,i| #checks opp & adj spaces to prevent loss
        if c != " " && c != token
          #block vertical wins
          return (i + 7).to_s if cells[i + 3] == c && board.valid_move?((i+7).to_s)
          return (i + 4).to_s if cells[i + 6] == c && board.valid_move?((i+4).to_s)
          return (i - 4).to_s if cells[i + 3] == c && board.valid_move?((i-4).to_s)
          #block diagonal wins
          opposite = 8 - i
          opp_move = 12 - opposite - i + 1
          return (opp_move).to_s if cells[opposite] == c && board.valid_move?(opp_move.to_s)
          return (opposite).to_s if cells[4] == c && board.valid_move?(opposite.to_s)
          #block horizontal wins
          return (i + 3).to_s if cells[i + 1] == c && board.valid_move?((i+3).to_s)
          return (i - 3).to_s if cells[i - 1] == c && board.valid_move?((i-3).to_s)
        end
      end

      rand(1..9).to_s
    end
  end
end


##AI strategies

####1 -- Defensive
# check opposites
# loop through opponents positions
# for each position, check opposite space by y = 8-x
# if opposite space filled by oppenent, take space in between by y = 12 -
#


###board###
##[0,1,2]##
##[3,4,5]##
##[6,7,8]##
