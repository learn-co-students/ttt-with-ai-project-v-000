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

    PRIORITY_ORDER = [
                      [2,1],
                      [2,0],
                      [1,2],
                      [1,1],
                      [0,2],
                      [1,0],
                      [0,1]
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
            think_harder(board) #if no winning move, and no blocking move required, time to get more complicated
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

    def think_harder(board)
      # remember if I'm using this method, it's becuase I can't win immdiately and there's no block immdiately required

      potential_combos_for_opponent_to_win = get_combos_with_potential_for_a_certain_player_to_win(board, self.op_token, self.token)
      potential_combos_for_me_to_win = get_combos_with_potential_for_a_certain_player_to_win(board, self.token, self.op_token)

      if potential_combos_for_opponent_to_win.length == 0 && potential_combos_for_me_to_win.length == 0
        #there's no way anyone can win. Just pick a cell without thought to fill up board and finish game
        next_move = pick_move_without_thought(board)
        return next_move
      else

        potential_array_with_cell_indices = get_priority_sets_with_cell_indices(board, potential_combos_for_me_to_win, potential_combos_for_opponent_to_win)
        # e.g [[[1, 2], [2, 6]], [[1, 1], [1, 3]], [[0, 2], [5, 7]]]

        potential_array_with_cell_indices.each do |priority_set|
          # priority_set e.g [[1, 2], [2, 6]]
          if priority_set[0][0] == 1 && priority_set[0][1] == 2
            #here i'm going to look at cells where there is potential for me win in 1 direction,
            # and my opponent to win in two directions
            #I want to put my token in a high impact cell to stop my opponent
            #But in this case, I need to be careful not to force my opponent to block me on their next turn in a cell that
            # is actually very helpful for them
            new_attempt = -1
            priority_set[1].each do |cell_index|
              cells = board.cells.dup
              cells[cell_index] = self.token
              #if I make the move, will opponent be forced to block me?
              winning_cell_index = can_someone_win_next_turn?(cells, self.token)
              if ! priority_set[1].include?(winning_cell_index) && winning_cell_index != -1
                #if I don't force a block on a cell that's helpful for the opponent, make the move
                new_attempt = cell_index + 1
                return new_attempt.to_s
              end
            end #do
          else
            #there's no worry, just pick first cell in set
            new_attempt = priority_set[1][0] + 1
            return new_attempt.to_s
          end
        end #do
      end
    end #think_harder

    def pick_move_without_thought(board)
      cellnum = 1
      while board.taken?(cellnum.to_s)
        cellnum = cellnum + 1
      end
      cellnum.to_s
    end


    def get_combos_with_potential_for_a_certain_player_to_win(board, winner_token, opponent_token)
      potential_combos=[]
      WIN_COMBINATIONS.each do |combo|
        if board.cells[combo[0]] != opponent_token && board.cells[combo[1]] != opponent_token && board.cells[combo[2]] != opponent_token
          if board.cells[combo[0]] == winner_token || board.cells[combo[1]] == winner_token || board.cells[combo[2]] == winner_token
            #combo has none of opponent's tokens and at least 1 of winner's tokens.
            #this combo has potential for winner_token player to win
            potential_combos << combo
          end
        end
      end
      potential_combos.each do |combo|
      end
      potential_combos
    end

    def get_empty_cells_with_potential_for_a_certain_player_to_win(board, potential_combos)

      empty_cells_with_potential = []
      potential_combos.each do |combo|
        combo.each do |cell_index|
          if board.cells[cell_index] == " "
            empty_cells_with_potential << cell_index
          end
        end
      end
      empty_cells_with_potential.sort!
    end

    def build_potential_array (empty_cells_with_potential_for_me_to_win, empty_cells_with_potential_for_opponent_to_win)

      potential_array =[[0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0]]
      # array[cell_index][0] = my potential at cell_index
      # array[cell_index][1] = opponent's potential at cell_index
      # 0 potential if cell is already taken, or no way I can win using that cell

      empty_cells_with_potential_for_me_to_win.each do |cell_index|
        potential_array[cell_index][0] = potential_array[cell_index][0] + 1
      end

      empty_cells_with_potential_for_opponent_to_win.each do |cell_index|
        potential_array[cell_index][1] = potential_array[cell_index][1] + 1
      end
      potential_array
    end

    def get_priority_sets_with_cell_indices (board, potential_combos_for_me_to_win, potential_combos_for_opponent_to_win)

      #now that i know which ways have potential for me to win, find cells still available for taking
      #the cells that appear multple times are high impact - they have high potential for me
      # a cell can have a certain potential for me to win, and a certain potential for my opponent to win
      # this makes a set [my potential at a cell, my opponent's potential at the same cell]
      #find this information for me and my opponent

      empty_cells_with_potential_for_me_to_win = get_empty_cells_with_potential_for_a_certain_player_to_win(board, potential_combos_for_me_to_win)
      empty_cells_with_potential_for_opponent_to_win = get_empty_cells_with_potential_for_a_certain_player_to_win(board, potential_combos_for_opponent_to_win)
      potential_array = build_potential_array(empty_cells_with_potential_for_me_to_win, empty_cells_with_potential_for_opponent_to_win)

      # the potential_array holds the the set [my potential, my opponent's potential] for each cell index
      # after the frist few moves, there are only a handful of possible sets
      # how I prioritize these sets is stored in the constant PRIORITY_ORDER
      # it is the heart of the balance between offence and defence

      # restructure the potential_array so that it shows only the sets that exist on the current board and in the order that matches the constant PRIORITY_ORDER
      # with each set, store the cells with those potentials
      # this way, I'll have the cells stored in order of priority, and know their potentials too

      potential_array_with_cell_indices = []


      PRIORITY_ORDER.each do |priority_set|

        cells_with_priority_set = potential_array.each_index.select{|i| potential_array[i] == priority_set}
        if cells_with_priority_set.length > 0
          potential_array_with_cell_indices << [priority_set, cells_with_priority_set]
        end
      end
      potential_array_with_cell_indices
    end

  end #end class Computer
end #end Module Players
