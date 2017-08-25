class Game

    attr_accessor :board, :player_1, :player_2

    def initialize (player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
        @board = board
        @player_1 = player_1
        @player_2 = player_2
    end

    WIN_COMBINATIONS = [
        [0,1,2],
        [3,4,5],
        [6,7,8],
        [0,3,6],
        [1,4,7],
        [2,5,8],
        [0,4,8],
        [2,4,6]
    ]

  def turn_count
    turn_count = 0
    @board.cells.each do |data|
      if data == "X" || data == "O"
        turn_count += 1
      end
    end
    return turn_count
  end

  def current_player
    count = turn_count
    if count % 2 == 0
      return @player_1
    else
      return @player_2
    end
  end

  def won?
    WIN_COMBINATIONS.each do |combo|
      pos_1=combo[0]
      pos_2=combo[1]
      pos_3=combo[2]
      if @board.cells[pos_1] == @board.cells[pos_2] && @board.cells[pos_2] == @board.cells[pos_3] && @board.cells[pos_1] != " "
        return combo
      end
    end
    return false
  end

  def full?
    @board.cells.none?{|i| i==" "}
  end

  def draw?
    if full? && !won?
      return true
    else
      return false
    end
  end

  def over?
    if draw? || won?
      return true
    else
      return false
    end
  end

  def winner
    if won?
      combo = won?
      winner = @board.cells[combo[0]]
      return winner
    else
      return nil
    end
  end

  def turn
       @board.display
       puts " "
       move = current_player.move(@board)
       if !@board.valid_move?(move)
            turn
        else
            @board.update(move, current_player)
        end
  end

  def clear_screen
    puts "\e[H\e[2J"
  end

  def play
    turn_count= 0
    while turn_count <9
      if over?
        break
      end
      count = turn_count
      clear_screen
      turn
    end
    clear_screen
    if won?
      winning_player = winner
      puts "Congratulations #{winning_player}!"
    elsif draw?
      puts "Cat's Game!"
    end
    @board.display
  end

    def start
        select_players
        play
    end




    def select_players
        human_players = nil
        until human_players != nil && human_players >= 0 && human_players <= 2 do
            puts "Select the number of human players (0-2):"
            human_players = gets.strip.to_i
        end
        human_players
        case human_players 
            when 0
                @player_1 = Players::Computer.new("X")
                @player_2 = Players::Computer.new("O")
            when 1
                @player_2 = Players::Computer.new("O")
        end
    end

end