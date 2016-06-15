class Computer < Player

  def tokens_in_wincombo    #wincombo to tokens
    Game::WIN_COMBINATIONS.collect do |combo|
  	   combo.collect { |c| c = @board_cells[c] }
  	end
  end

  def wincombo2token_count
     #count each token and empty cells from tokens_in wincombo  and return hash
  	tokens_in_wincombo.collect do |combo|
  		{nX: combo.count {|c| c == "X" },
  		 nO: combo.count {|c| c == "O" },
  		 nE: combo.count {|c| c == " " }}
  	end
  end



  def winning_array_index4_X
	  wincombo2token_count.index do |combo|
		  combo[:nX] == 2 && combo[:nE] == 1
	  end
  end

  def winning_array_index4_O
    wincombo2token_count.index do |combo|
      combo[:nO] == 2 && combo[:nE] == 1
    end
  end

  def winning_array_index
    if @token == "X"
      return winning_array_index4_X
    elsif @token == "O"
      return winning_array_index4_O
    end
  end



  def empty_cell4w #find an empty cell in winning array
    Game::WIN_COMBINATIONS[winning_array_index].index do |c|
      @board_cells[c] == " "
    end
  end

  def empty_cell4b #find an empty cell in blocking array
    Game::WIN_COMBINATIONS[blocking_array_index].index do |c|
      @board_cells[c] == " "
    end
  end

  def winning_position
      (Game::WIN_COMBINATIONS[winning_array_index][empty_cell4w] + 1).to_s
  end

  def opponent_token
    if self.token == "X"
      return "O"
    else
      return "X"
    end
  end

  def blocking_array_index
    if @token == "O"
      return winning_array_index4_X
    elsif @token == "X"
      return winning_array_index4_O
    end
  end

  def blocking_position
    (Game::WIN_COMBINATIONS[blocking_array_index][empty_cell4b] + 1).to_s
  end

  def center_position_empty?
    empty_cells.include?("5")
  end


  def potential_array_index4_X
    wincombo2token_count.index do |combo|
      combo[:nX] == 1 && combo[:nE] == 2
    end
  end

  def potential_array_index4_O
    wincombo2token_count.index do |combo|
      combo[:nO] == 1 && combo[:nE] == 2
    end
  end

  def potential_array_index
    if @token == "X"
      return potential_array_index4_X
    elsif @token == "O"
      return potential_array_index4_O
    end
  end

  def empty_cell4p #find an empty cell in potential winning array and return index of that array
    #prefer a corner cell
#    Game::WIN_COMBINATIONS[potential_array_index].index do |c| #collect with index
#      @board_cells[c] == " "
    potential_array = Game::WIN_COMBINATIONS[potential_array_index]
    if @board_cells[potential_array[0]] == " " # corner cell
      return 0
    elsif @board_cells[potential_array[2]] == " " #another corner cell
      return 2
    else                  #middle cell
      return 1
    end
  end


  def potential_winning_move
    (Game::WIN_COMBINATIONS[potential_array_index][empty_cell4p] + 1).to_s
  end

  def corner_position_empty?
    collect_positions(" ").include?("1") ||
    collect_positions(" ").include?("3") ||
    collect_positions(" ").include?("7") ||
    collect_positions(" ").include?("9")
  end

  def corner_position
    collect_positions(" ").select {|c| c == "1" || c == "3" || c == "7" || c == "9"}.sample
  end

  def move(board_cells)
    @board_cells = board_cells
<<<<<<< HEAD
#    sleep 1
=======
    sleep 1
>>>>>>> df92f2bf743f893a00d6ba855be3bb01fc234a4c
    if winning_array_index
      return winning_position
    elsif blocking_array_index
      return blocking_position
    elsif center_position_empty?
      return "5"
    elsif potential_array_index
      return potential_winning_move
    elsif corner_position_empty?
      return corner_position
    else
      empty_cells.sample
    end
  end

  def collect_positions(token_or_empty)
  	@board_cells.each_index.select {|i| @board_cells[i] == token_or_empty}.collect {|n| (n+1).to_s }
  end

  def empty_cells
    collect_positions(" ")
  end



end

