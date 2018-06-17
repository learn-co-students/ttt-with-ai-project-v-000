module Players
  class Computer < Player
    # your code here

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

    def move(board)
      ai_move(board)
    end

    def ai_move(board)
      if board.turn_count < 2 #always play middle as first move if available
        if !board.taken?(5)
          next_move = "5" #middle is free - take it
        else
          next_move = "1" #middle is taken - so take a corner
        end
      elsif board.turn_count==2 #I'm player 1. I startd with middle. Either opponent picked a corner or regular edge cell
        op_first_move_details = op_first_move(board) #array[cellnum, celltype]
        if op_first_move_details[1] =="edge" #go to one of the farthest corners
          if op_first_move_details[0] + 5 <= 9
            next_move = (op_first_move_details[0] + 5).to_s
          else
            next_move = (op_first_move_details[0] - 5).to_s
          end
        else #opponent picked a corner
          case op_first_move_details[0] #go to opposite corner
            when 1
              next_move = "9"
            when 3
              next_move = "7"
            when 7
              next_move = "3"
            when 9
              next_move = "1"
          end
        end
      else
        winning_move = can_someone_win_next_turn?(board.cells, self.token) #check if there's a way you can win, returns cell_index
        if winning_move > -1
          next_move = (winning_move + 1).to_s
        else
          block_move = can_someone_win_next_turn?(board.cells, self.op_token) #check if there's a way opponent can win. If yes, block it
          if block_move > -1
            next_move = (block_move + 1).to_s
          else
            opponent_potential(board) #if no winning move, and no blocking move required, time to get more complicated
          end
        end
      end

    end

    def op_first_move(board)
        op_first_move_details = [-1, "none"] #opponent's cell number, and cell type (corner or edge, or middle)
        for i in 1..9
          if board.position(i) == self.op_token
            op_first_move_details[0] = i
            if i==1 || i==3 || i==7 || i==9 #corner cell
              op_first_move_details[1]="corner"
            elsif i==5
              op_first_move_details[1]="middle"
            else
              op_first_move_details[1]="edge"
            end
            break
          end
        end
        #puts "Player #{self.op_token} went here: #{op_cell_details[0]}, type is #{op_cell_details[1]}"
        op_first_move_details
    end

    def can_someone_win_next_turn?(cells, token)
      cell_index = -1
      WIN_COMBINATIONS.each do |combo|
        if cells[combo[0]] == cells[combo[1]] && cells[combo[1]] == token && cells[combo[2]] == " "
          cell_index = combo[2]
          return cell_index
        elsif cells[combo[1]] == cells[combo[2]] && cells[combo[2]] == token && cells[combo[0]] == " "
          cell_index = combo[0]
          return cell_index
        elsif cells[combo[0]] == cells[combo[2]] && cells[combo[2]] == token && cells[combo[1]] == " "
          cell_index = combo[1]
          return cell_index
        end #ifs
      end #do
      return cell_index
    end #def  

    def opponent_potential(board)

      potential_combos=[]
      WIN_COMBINATIONS.each do |combo|
        if board.cells[combo[0]] != self.token && board.cells[combo[1]] != self.token && board.cells[combo[2]] != self.token
          if board.cells[combo[0]] == self.op_token || board.cells[combo[1]] == self.op_token || board.cells[combo[2]] == self.op_token
            #combo has none of my tokens and at least 1 of opponent's tokens.
            #this combo has potential for oppponent to win
            potential_combos << combo
          end
        end
      end

      if potential_combos.length >0

        potential_combos.each do |combo|
          puts "Potential combo for #{self.op_token}: #{combo[0]}, #{combo[1]}, #{combo[2]}"
        end

        #now that i know which ways have potential for opponent to win, find cells still available for opponent
        empty_cells_with_op_potential = []
        potential_combos.each do |combo|
          combo.each do |cell_index|
            if board.cells[cell_index] == " "
              empty_cells_with_op_potential << cell_index
            end
          end
        end
        empty_cells_with_op_potential.sort!
        puts "Empty Cells with potential: #{empty_cells_with_op_potential}"
        #the cells that appear multple times are high impact
        #I want to put my token in a high impact cell to stop my opponent
        #But I need to be careful not to force my opponent to block me on their next turn in a cell that
        # is actually very helpful for them

        hash_empty_cells = Hash.new
        empty_cells_with_op_potential.each do |cell_index|
          if hash_empty_cells[cell_index] == nil
            hash_empty_cells[cell_index] = 1
          else
            hash_empty_cells[cell_index] += 1
          end
        end
        hash_empty_cells.each do |cell_index, potential|
          puts "#{cell_index} appears #{potential} times"
        end
        highest_potential_cells=[]
        hash_empty_cells.each { |cell_index, potential| highest_potential_cells << cell_index if potential == hash_empty_cells.values.max }
        puts "#{highest_potential_cells}"

        if highest_potential_cells.count > 1 && hash_empty_cells.values.max > 1
          new_attempt = -1
          highest_potential_cells.each do |cell_index|
            cells = board.cells.dup
            cells[cell_index] = self.token
            puts "Board cells: #{board.cells}"
            puts "Test cells: #{cells}"
            #if I make the move, will I win my next turn (ie will opponent be forece to block me)
            winning_cell_index = can_someone_win_next_turn?(cells, self.token)
            puts "I would force a block here: #{winning_cell_index}"
            if ! highest_potential_cells.include?(winning_cell_index) && winning_cell_index != -1
              new_attempt = cell_index
            end
          end #do
          if new_attempt == -1
              hash_empty_cells.each do |cell_index, potential|
                if potential != hash_empty_cells.values.max
                  new_attempt = cell_index
                end
                break if new_attempt != -1
              end #do
          end
          new_attempt = new_attempt + 1
          return new_attempt.to_s
        else
          new_attempt = highest_potential_cells[0] + 1
          return new_attempt.to_s
        end
      else
        cellnum = 1
        while board.taken?(cellnum.to_s)
          cellnum = cellnum + 1
        end
        puts "It doesn't matter anymore. There is no potential to win anywhere. So I pick: #{cellnum}"
        cellnum.to_s

      end

    end #opponent_potential





  end #end class Computer
end #end Module Players
