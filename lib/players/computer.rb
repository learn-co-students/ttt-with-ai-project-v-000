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

    attr_accessor :last_attempt, :op_first_move_details

    def move(board)
      ai_move(board)
    end

    def ai_move(board)

      if self.token=="X"
        #player 1 strategy
        player1_strategy(board)
      else
        #player 2 strategy
        player2_strategy(board)
      end

    end

    def player1_strategy(board)
      if board.turn_count==0 #always play middle as first move if player_1
        next_move = "5"
      elsif board.turn_count==2 #either opponent picked a corner or regular edge cell (since you piccked the middle)
        op_first_move(board) #array[cellnum, celltype]
        if @op_first_move_details[1] =="edge"
          if @op_first_move_details[0] + 5 <= 9
            next_move = (@op_first_move_details[0] + 5).to_s
          else
            next_move = (@op_first_move_details[0] - 5).to_s
          end
        else #opponent picked a corner
          case @op_first_move_details[0] #go to opposite corner
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
        winning_move = can_i_win?(board) #if it's not your first move, check if there's a way you can win
        if winning_move > -1
          next_move = (winning_move + 1).to_s
        else
          block_move = should_i_block?(board) #if there's no way for you to win, check if you should block
          if block_move > -1
            next_move = (block_move + 1).to_s
          elsif board.cells[0] == " " #if there's a corner free - take it
            next_move = "1"
          elsif  board.cells[2] == " "
            next_move = "3"
          elsif  board.cells[6] == " "
            next_move = "7"
          elsif  board.cells[8] == " "
            next_move = "9"
          else
            no_strategy(board)
          end
        end
      end

    end

    def player2_strategy(board)
      if board.turn_count==1
        if board.taken?(5)
          next_move = "1" #just take a corner
        else
          next_move = "5" #just take middle
        end
      else
        winning_move = can_i_win?(board) #check if there's a way you can win
        if winning_move > -1
          next_move = (winning_move + 1).to_s
        else
          block_move = should_i_block?(board) #if there's no way for you to win, check if you should block
          if block_move > -1
            next_move = (block_move + 1).to_s
          else
            opponent_potential(board)
            #no_strategy(board)
          end
        end
      end
    end

    def no_strategy(board)
        new_attempt = 1
        if @last_attempt == nil
          @last_attempt = 1
        elsif new_attempt <= @last_attempt
          new_attempt = @last_attempt + 1
        end
        @last_attempt = new_attempt
        return new_attempt.to_s
    end

    def can_i_win?(board)
        #puts "The winning move for #{self.token} is number: #{winningmove?(self.token, board)}"
        winningmove?(self.token, board)
    end

    def should_i_block?(board)

        puts "You should block #{self.op_token} here: #{winningmove?(self.op_token, board)}"
        winningmove?(self.op_token, board)
    end
    def winningmove?(token, board)
        cellnum = -1
        WIN_COMBINATIONS.each do |combo|
          #puts "#{combo[0]}, #{combo[1]}, #{combo[0]}"
          #puts "#{board.cells[combo[0]]}, #{board.cells[combo[1]]}, #{board.cells[combo[2]]}"
          if board.cells[combo[0]] == board.cells[combo[1]] && board.cells[combo[1]] == token && board.cells[combo[2]] == " "
            cellnum = combo[2]
            return cellnum
          elsif board.cells[combo[1]] == board.cells[combo[2]] && board.cells[combo[2]] == token && board.cells[combo[0]] == " "
            cellnum = combo[0]
            return cellnum
          elsif board.cells[combo[0]] == board.cells[combo[2]] && board.cells[combo[2]] == token && board.cells[combo[1]] == " "
            cellnum = combo[1]
            return cellnum
          end
        end
        return cellnum
    end

    def op_first_move(board)
        @op_first_move_details = [-1, "none"] #opponent's cell number, and cell type (corner or edge, or middle)
        for i in 1..9
          if board.position(i) == self.op_token
            @op_first_move_details[0] = i
            if i==1 || i==3 || i==7 || i==9 #corner cell
              @op_first_move_details[1]="corner"
            elsif i==5
              @op_first_move_details[1]="middle"
            else
              @op_first_move_details[1]="edge"
            end
            break
          end
        end
        #puts "Player #{self.op_token} went here: #{op_cell_details[0]}, type is #{op_cell_details[1]}"
        #@op_first_move_details
    end

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
      #But I need to be careful if there are two cells tied for the highest impact
      #I don't want to force my opponent to do a block on their next turn that's in the other high impact cell
      #This would lead to losing the following turn

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
        #need to figure out which (if any) to use
        #create a board with the next move to see if opponent will need to block in the cell that's tied for potential
        # test_board = Board.new(board.cells)
        # test_player = Player.new(self.token)
        # test_board.update(highest_potential_cells[0].to_s, test_player)
        # puts " Your move means #{self.op_token} will have to block here: #{can_i_win?(test_board)}"
        # op_next_move = can_i_win?(test_board) - 1
        # new_attempt = highest_potential_cells[0] + 1
        # return new_attempt.to_s

        #is there a winning combination that includes the highest_potential_cells?
        new_attempt = -1
        highest_potential_cells.each do |cell_index|
          cells = board.cells.dup
          cells[cell_index] = self.token
          puts "Board cells: #{board.cells}"
          puts "Test cells: #{cells}"
          winning_cell_index = will_block_be_required_by_opponent?(cells, self.token)
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

    end #opponent_potential

    def test_for_high_priority_winning_combo (cell_list)
      third_cell = -1
      WIN_COMBINATIONS.each do |combo|
        if combo[0]==cell_list[0] || combo[0]==cell_list[1]
          if combo[1]==cell_list[0] || combo[1]==cell_list[1]
            third_cell = combo[2]
          elsif combo[2]==cell_list[0] || combo[2]==cell_list[1]
            third_cell = combo[1]
          end
        elsif combo[1]==cell_list[0] || combo[1]==cell_list[1]
            if combo[2]==cell_list[0] || combo[2]==cell_list[1]
              third_cell = combo[0]
            end
        end
        break if third_cell != -1
      end
      third_cell
    end

    def will_block_be_required_by_opponent?(cells, mytoken)
      cellnum = -1
      WIN_COMBINATIONS.each do |combo|
        if cells[combo[0]] == cells[combo[1]] && cells[combo[1]] == mytoken && cells[combo[2]] == " "
          cellnum = combo[2]
          return cellnum
        elsif cells[combo[1]] == cells[combo[2]] && cells[combo[2]] == mytoken && cells[combo[0]] == " "
          cellnum = combo[0]
          return cellnum
        elsif cells[combo[0]] == cells[combo[2]] && cells[combo[2]] == mytoken && cells[combo[1]] == " "
          cellnum = combo[1]
          return cellnum
        end #ifs
      end #do
      return cellnum
    end #def

  end #end class Computer
end #end Module Players
