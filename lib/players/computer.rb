class Computer < Player

	  # WIN_COMBINATIONS = [[0,1,2],
    #                   [3,4,5],
    #                   [6,7,8],
    #                   [0,3,6],
    #                   [1,4,7],
    #                   [2,5,8],
    #                   [0,4,8],
    #                   [6,4,2]  ]

    #  WIN_POSITIONS = WIN_COMBINATIONS.collect do |combo|
    #  	combo.collect {|n| (n + 1).to_s}
    #  end
  def tokens_in_wincombo
    Game::WIN_COMBINATIONS.collect do |combo|
  	   combo.collect { |c| c = @board_cells[c] }
  	end
  end

  def wincombo2token_count
  	tokens_in_wincombo.collect do |combo|
  		{nX: combo.count {|c| c == "X" },
  		 nO: combo.count {|c| c == "O" },
  		 nE: combo.count {|c| c == " " }}
  	end
  end



  def winning_array_index
	  wincombo2token_count.index do |combo|
		  combo[:nX] == 2 && combo[:nE] == 1
	  end
  end

  def winning_cell_index
    Game::WIN_COMBINATIONS[winning_array_index].index do |c|
      @board_cells[c] == " "
    end
  end


  def winning_position
    (Game::WIN_COMBINATIONS[winning_array_index][winning_cell_index] + 1).to_s
  end

  def move(board_cells)
    @board_cells = board_cells
    sleep 1
    if winning_array_index
      return winning_position
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

  # def my_cells
  # 	collect_positions("self.token")
  # end

end
