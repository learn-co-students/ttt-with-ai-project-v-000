class Game

  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]]

  def initialize(player_1=nil, player_2=nil, board=nil)
    player_1 == nil ? @player_1 = Players::Human.new("X") : @player_1 = player_1
    player_2 == nil ? @player_2 = Players::Human.new("O") : @player_2 = player_2
    board == nil ?  @board = Board.new : @board = board
  end

  def board
    @board
  end

  def current_player
    @board.turn_count % 2 == 0 ? @player_1 : @player_2
  end

  def won?
    winner_found = false
    WIN_COMBINATIONS.each do |combo|
      tokens_played = combo.collect {|position| @board.cells[position]}
      winner_found = combo if (tokens_played.all?("X") || tokens_played.all?("O"))
    end
    winner_found
  end

  def draw?
    @board.full? && !won?
  end

  def over?
    draw? || won?
  end

  def winner
    if won?
      @board.cells.count {|position| position == "X"} > @board.cells.count {|position| position == "O"} ? "X" : "O"
    end
  end

  def turn
    loop do
      move = current_player.move(@board)

      if move != "invalid"
        @board.update(move, current_player)
        move
        break
      end
    end
  end

  def board_display
    puts "Current board"

    index = 0
    board_string = ""

    while index < 10
      board_string += "| #{@board.cells[index]} "
      board_string += "|\n" if index == 2 || index == 5
      index += 1
    end

    puts board_string

  end

  def request_position
    position_req = "Select an open square"
    position_req += ", #{current_player.name}" if current_player.name != nil
    position_req += ":"
    puts position_req if current_player.class == Players::Human
  end

  def play

    while !over?
      request_position
      board_display if current_player.class == Players::Human
      turn
    end
    if winner != nil
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end

  def self.start
    puts "Please enter the number of players (0, 1, 2):"
    player_count = gets.chomp

    game_count = 1
    won_count = 0

    if player_count == "wargames"
      puts "Thermonuclear War"
      game_count = 100
      @player_1 = Players::Computer.new("X")
      @player_2 = Players::Computer.new("O")

    elsif player_count == "0"
      puts "You have asked for 2 Computer players."
      @player_1 = Players::Computer.new("X")
      @player_2 = Players::Computer.new("O")

    elsif player_count == "1"
      puts "You have asked for 1 Human player and 1 Computer player. Do you want X (Player 1) or 0 (Player 2)?"
      human_token = gets.chomp

      if human_token == "X"
        @player_1 = Players::Human.new("X")
        @player_2 = Players::Computer.new("O")
      elsif human_token == "O"
        @player_1 = Players::Computer.new("X")
        @player_2 = Players::Human.new("O")
      end

    elsif player_count == "2"
      puts "You have asked for a 2 Human player game. Who will be X (Player 1)?"
      name1 = gets.chomp
      puts "Who will be O (Player 2)?"
      name2 = gets.chomp

      @player_1 = Players::Human.new("X",name1)
      @player_2 = Players::Human.new("O",name2)

    end

    while (game_count > 0 )
      game = self.new(@player_1,@player_2)
      game.play

      won_count += 1 if game.winner != nil
      game_count -= 1
    end

    puts "Outcome: #{won_count} games won."

  end

end
