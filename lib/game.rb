class Game
  attr_accessor :board, :player_1, :player_2, :wargames_flag, :wargames_counter, :wargames_one_wins, :wargames_two_wins

  WIN_COMBINATIONS = [  # win combinations
  [0,1,2], # Top row
  [3,4,5], # Middle row
  [6,7,8], # Bottom row
  [0,3,6], # left c
  [1,4,7], # middle c
  [2,5,8], # right c
  [0,4,8], # diag lr
  [2,4,6]  # diag rl
  ]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new, wargames_flag = false)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
    @board.token_1 = @player_1.token
    @board.token_2 = @player_2.token
    @wargames_flag = wargames_flag
    @wargames_counter = 0
    @wargames_one_wins = []
    @wargames_two_wins = []
    player_1.game = self
    player_2.game = self
    @player_1.turn_value = 1
    @player_2.turn_value = 2
    if player_1.class == Players::Computer
      @player_1.skill = Options.cpu_one_skill[0]
      if @player_1.skill == 2
        @player_1.seed = rand(1..100)
      end
    end
    if player_2.class == Players::Computer
      @player_2.skill = Options.cpu_two_skill[0]
      if @player_2.skill == 2
        @player_2.seed = rand(1..100)
      end
    end
  #  self.player_skill_call #troubleshooting
  end

  def current_player #x goes first
    board.turn_count.even? ? player_1 : player_2
  end

  def full?  # if all slots on board are filled by a player_token, return true
    @board.cells.all? {|i| i == player_1.token || i == player_2.token }
  end

  def draw?
    full? && (!!won? == false)
  end

  def won?
    Game::WIN_COMBINATIONS.detect do |c|
      c.all? {|i| board.cells[i] == player_1.token} || c.all? {|i| board.cells[i] == player_2.token}
    end
  end

  def winner
    board.cells[won?[0]] unless won? == nil
  end

  def play
    if @wargames_flag == false
      while !over?
        turn
      end
      if won?
          @board.display
          puts "Congratulations #{winner}!"
          Options.end_game
      elsif draw?
        puts "Cat's Game!"
        Options.end_game
      end
    else
      while !over?
        wargames_turn
      end
      if @wargames_counter == 100
        puts "-------------------"
        puts "--Outcomes Report--"
        puts "CPU One Wins: #{@wargames_one_wins.size}"
        puts "CPU Two Wins: #{@wargames_two_wins.size}"
        puts "Total Wins: #{@wargames_one_wins.size + @wargames_two_wins.size}"
        puts "-------------------"
        puts "The only winning move is not to play" if @wargames_one_wins.size + @wargames_two_wins.size == 0
      elsif won?
        unless @wargames_counter == 100
          @wargames_one_wins << winner if winner == @player_1.token
          @wargames_two_wins << winner if winner == @player_2.token
          @wargames_counter += 1
          @board.reset!
          self.play
        end
      elsif draw?
        unless @wargames_counter == 100
          @wargames_counter += 1
          @board.reset!
          self.play
        end
      end
    end
  end

  def turn
    board.display
    puts "Turn #{board.turn_count+1}:"
    puts "Player #{current_player.token}, please enter your move (1-9):"
    the_move = current_player.move(self.board)
    board.valid_move?(the_move) ? board.update(the_move, current_player) : turn
  end

  def wargames_turn
    the_move = current_player.move(self.board)
    board.valid_move?(the_move) ? board.update(the_move, current_player) : wargames_turn
  end

  def over?
    !!won? || draw?
  end

  #def player_skill_call #troubleshooting
  #  puts "Computer skill value is #{self.player_1.skill}" if self.player_1.class == Players::Computer
  #  puts "Computer skill value is #{self.player_2.skill}" if self.player_2.class == Players::Computer
  #end

end
