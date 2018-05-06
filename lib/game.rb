
class Game
  
  WIN_COMBINATIONS = [
    [0,1,2], #top row
    [3,4,5], #mid row
    [6,7,8], #bot row
    [0,3,6], #left col
    [1,4,7], #mid col
    [2,5,8], #right col
    [0,4,8], #l>r diag
    [2,4,6]  #r>l diag
  ]

  attr_accessor :board, :player_1, :player_2
  
  def initialize(player_1=Players::Human.new('X'), player_2=Players::Human.new('O'), board=Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board 
  end
  
  def self.start
    play = true 
    while play
      puts "How many players?"
      player_num = choose_player 
      if player_num == "0"
        game = Game.new(player_1=Players::Computer.new('X'), player_2=Players::Computer.new('O'))
      elsif player_num == "1"
        puts "Who will go first? Press c for the computer or h for human."
        player1 = gets.chomp 
          if player1 == 'c'
            game = Game.new(player_1=Players::Computer.new('X'), player_2=Players::Human.new('O'))
          else 
            game = Game.new(player_1=Players::Human.new('X'), player_2=Players::Computer.new('O'))
          end
      else 
        game = Game.new 
      end
      puts "Let's play!"
      game.play 
      puts "Nice job! Would you like to play again? y/n"
      input = gets.chomp 
      input == 'y' ? play : play = false 
    end
    puts "Buh bye!"
  end
  
  def self.war
    war_quotes = ["Cry 'Havoc!', and let slip the dogs of war. -Shakespeare, Julius Caesar", "The two most powerful warriors are patience and time. -Leo Tolstoy", "You must not fight too often with one enemy, or you will teach him all your art of war. -Napolean Bonaparte", "The supreme art of war is to subdue the enemy without fighting. -Sun Tzu", "To be prepared for war is one of the most effective ways of preserving peace. -George Washington"]
    war_log = {x: 0, o: 0, cat: 0}
    100.times do
      game = Game.new(player_1=Players::Computer.new('X'), player_2=Players::Computer.new('O'))
      until game.over?
        game.turn
      end
      if game.won?
        war_log[winner.downcase.to_sym] += 1
      else
        war_log[:cat] += 1
      end
    end
    puts war_quotes.sample
    puts war_log
  end
  
  # #Game.start helper methods 
  def self.choose_player
    valid_choices = ["0", "1", "2", "wargames"]
    player_num = "-1"
    puts "How many players?"
    until valid_choices.include?(player_num)
      puts "Please enter 1, for one-player mode, 2 for two-player mode,"
      puts "or 0 for the computer to play itself."
      player_num = gets.chomp
    end
    player_num
  end
      
  # returns currently player based on number of turns already taken 
  # board object tracks turns already taken 
  def current_player
    board.turn_count.even? ? player_1 : player_2
  end

  # Validation methods:
  
  # checks WIN_COMBINATIONS and board too look for a winner, returns winning combination
  def won?
    winner = nil
    WIN_COMBINATIONS.each do |combo|
      converted_combo = combo.collect{ |i| board.cells[i] }
      if converted_combo.all?{|cell| cell == "X"} || converted_combo.all?{|cell| cell == "O"}
        winner = combo 
      end
    end
    winner 
  end


  #are all the spaces full without a winning combination?
  def draw?
    !won? && board.full?
  end

  #game over?
  def over?
    won? || draw?
  end

  # checks to see who is the winner, returns X, O, or nil
  # if there is a winner, 
  # use won? (returns the winning combo from WIN_COMBINATIONS) to index into board cells
  # else nil 
  def winner
    won? ? board.cells[won?[0]] : nil 
  end

  def turn
    move = current_player.move(board)
    until board.valid_move?(move)
      move = current_player.move(board)
    end
    board.update(move, current_player)
  end
    

  def play
    until over?
      board.display
      turn
    end
    if won?
      board.display
      puts "Congratulations #{winner}!"
    else
      board.display
      puts "Cat's Game!"
    end
  end


end
