class WarGames < Game
  attr_accessor :games, :winners, :start_time, :end_time, :x_wins, :o_wins, :x_win_boards, :o_win_boards

  # Special game-play for War Games.
  def play

    # Set the number of games to be played by asking the user. Initialize empty arrays for stats attributes.
    self.games        = num_of_games
    self.winners      = []
    self.x_wins       = []
    self.o_wins       = []
    self.x_win_boards = []
    self.o_win_boards = []

    # Start the timer.
    self.start_time = Time.now

    # Simulate the number of games chosen by the user.
    # Call the super method, collect the game states, reset the board, repeat.
    eval("#{games}").times do
      super
      collect_game_stats
      board.reset!
    end

    # Stop the timer. Generate the report, and ask if the user wants to pry open the results.
    self.end_time = Time.now
    winners_report
    pry?
  end

  # Collect stats for reporting.
  def collect_game_stats

    # Add the winning token to the winners array.
    winners << winner if winner

    # Collect the winner's board positions and the complete board array.
    if winner == 'X'
      x_wins << player_1.board_positions.dup
      x_win_boards << board.cells
    elsif winner == 'O'
      o_wins << player_2.board_positions.dup
      o_win_boards << board.cells
    end
  end

  # Ask the user how many games they want to simulate.
  def num_of_games
    puts '', 'How many games do you want to simulate?'
    num = gets.chomp.to_i
    if num < 1
      puts '', 'Must be greater than zero'.bold.red
      num_of_games
    else
      num
    end
  end

  # Report the simulation stats. Display a graphic bar of the win distribution, and the percentage and total
  # number of games won by each side.
  def winners_report
    puts '', ''
    stats_bar
    puts '', "#{games} games completed in " + (end_time - start_time).to_s.yellow + ' seconds.'
    puts "X won #{(x_wins.size.to_f / games * 100).round(3)}%".red + " of the time (#{x_wins.size} games)."
    puts "O won #{(o_wins.size.to_f / games * 100).round(3)}%".blue + " of the time (#{o_wins.size} games)."
    puts "Cat's game #{(100 - (winners.size.to_f / games * 100)).round(3)}%".cyan +
             " of the time (#{games - winners.size} games)."
  end

  # Generate and animate a graphic visualization of the distribution of wins for each side.
  def stats_bar
    calculating_totals
    stats = []
    (x_wins.size.to_f / games * 50).round.times { stats << '='.bold.red }
    (o_wins.size.to_f / games * 50).round.times { stats << '='.bold.blue }
    (50 - (winners.size.to_f / games * 50)).round.times { stats << '='.bold.cyan }
    print "\r[".bold.yellow
    stats.each { |i| print i; sleep(0.02) }
    print ']'.bold.yellow
  end

  # Animate a flashing wait message. This is just for entertainment.
  def calculating_totals
    5.times do
      print "\rCalculating totals...".bold.yellow
      sleep(0.15)
      print "\r                     "
      sleep(0.05)
    end
  end

  # Ask the user if they want to inspect the simulation results.
  def pry?
    puts ''
    puts 'Would you like to open a ' + 'Pry'.blue + ' session to inspect the simulation results? (y/n)'
    input = gets.chomp.downcase
    case input
    when 'y'
      start_pry
    when 'n'
      nil
    else
      puts "Please enter 'y' or 'n'.".bold.red
      pry?
    end
  end

  # Create Board objects from board arrays, provide tips, and start pry.
  def start_pry
    initialize_win_boards
    pry_tips_message
    binding.pry
  end

  # Provide some tips on attributes to inspect, and display a sample win board.
  def pry_tips_message
    puts ''
    puts 'Useful attributes to inspect are: ' +
             ':winners, :x_wins, :x_win_boards, :o_wins,'.bold.blue + ' and ' + ':o_win_boards'.bold.blue
    puts 'You can display a board like this: ' + 'x_win_boards.last.display'.bold.blue
    display_sample_win_board
    puts '', 'Press enter to continue'.bold.blue
    gets
  end

  # Display a win board if there are any.
  def display_sample_win_board
    if x_win_boards.last
      x_win_boards.last.display
    elsif o_win_boards.last
      o_win_boards.last.display
    end
  end

  # Turn board arrays into Board objects when a pry session is started.
  def initialize_win_boards
    o_win_boards.map! do |brd|
      b       = Board.new
      b.cells = brd
      b
    end

    x_win_boards.map! do |brd|
      b       = Board.new
      b.cells = brd
      b
    end
  end
end
