class Game
    attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [ [0,1,2] , [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2]   ]

  def initialize(player_1=nil, player_2=nil, board=nil)
  	board.nil? ? @board = Board.new : @board = board
  	player_1.nil? ? @player_1 = Players::Human.new("X") : @player_1 = player_1
	  player_2.nil? ? @player_2 = Players::Human.new("O") : @player_2 = player_2

  end

  def current_player
    turn_count = @board.turn_count
	  if turn_count % 2 == 0
	  	@player_1
  	else
	  	@player_2
  	end
  end

  def check_win_combo(player)
      token = player.token;
      combos = Array.new
	    combos =  WIN_COMBINATIONS.detect do | combo |
	         pos_1 = @board.position(( combo[0] + 1).to_s)
	         pos_2 = @board.position(( combo[1] + 1).to_s)
	         pos_3 = @board.position(( combo[2] + 1).to_s)
	        pos_1 == token && pos_2 == token && pos_3 == token
      end
    combos.nil? ? false : combos
  end

  def won?
      player_1_win_combo = self.check_win_combo(@player_1)
	    player_2_win_combo = self.check_win_combo(@player_2)

	    if player_1_win_combo.kind_of?(Array)
    	  	player_1_win_combo
    	elsif player_2_win_combo.kind_of?(Array)
    		player_2_win_combo
    	else
	    	false
    	end
  end


  def draw?
    !(self.won?.kind_of?(Array))
  end

  def winner
    winner_combo = self.won?
  	if winner_combo.kind_of?(Array)
  		@board.position( (winner_combo[0] + 1).to_s)
  	else
  	   nil
  	end
  end

  def over?

    if self.won?
      true
    else
        if @board.full?
          true
        else
          false
        end
    end
  end

  def turn
    puts "Player #{self.current_player.token} -- Enter Position: "
	  input = self.current_player.move(@board)
    while !@board.valid_move?(input) do
      input = self.current_player.move(@board)
    end
    @board.update(input, self.current_player)
  end

  def play
  #  system "clear"
  #  @board.display

  while !self.over? do
    self.turn
  end
	 if self.won?.kind_of?(Array)
  	#	  @board.display
  		puts "Congratulations #{self.winner}!"
		else
  	#		@board.display
    	puts "Cat\'s Game!"
	   end
  end

end
