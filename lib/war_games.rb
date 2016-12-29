class WarGames < Game
  attr_accessor :games, :winners, :start_time, :end_time, :x_wins, :o_wins, :x_win_boards, :o_win_boards

  def play
    self.games        = num_of_games
    self.winners      = []
    self.x_wins       = []
    self.o_wins       = []
    self.x_win_boards = []
    self.o_win_boards = []

    self.start_time = Time.now

    eval("#{games}").times do
      super
      collect_game_data
      player_1.board_positions.clear
      player_2.board_positions.clear
      board.reset!
    end

    self.end_time = Time.now
    winners_report
  end

  def collect_game_data
    winners << winner unless winner.nil?

    if winner == 'X'
      x_wins << player_1.board_positions.dup
      x_win_boards << board.cells

    elsif winner == 'O'
      o_wins << player_2.board_positions.dup
      o_win_boards << board.cells

    end
  end

  def num_of_games
    puts '', 'How many games do you want to simulate?'
    gets.chomp.to_i
  end

  def winners_report
    puts '', ''
    stats_bar
    puts '', "#{games} games completed in " + (end_time - start_time).to_s.yellow + ' seconds.'
    puts "X won #{(x_wins.size.to_f / games * 100).round(3)}%".red + " of the time (#{x_wins.size} games)."
    puts "O won #{(o_wins.size.to_f / games * 100).round(3)}%".blue + " of the time (#{o_wins.size} games)."
    puts "Cat's game #{(100 - (winners.size.to_f / games * 100)).round(3)}%".cyan +
             " of the time (#{games - winners.size} games)."
  end

  def stats_bar
    5.times do
      STDOUT.print "\rCalculating totals...".bold.yellow
      sleep(0.15)
      STDOUT.print "\r                     "
      sleep(0.05)
    end
    stats = []
    (x_wins.size.to_f / games * 50).round.times { stats << '='.bold.red }
    (o_wins.size.to_f / games * 50).round.times { stats << '='.bold.blue }
    (50 - (winners.size.to_f / games * 50)).round.times { stats << '='.bold.cyan }
    print "\r[".bold.yellow
    stats.each { |i| print i; sleep(0.02) }
    print ']'.bold.yellow
  end
end