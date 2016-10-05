require 'pry'

class Game
attr_accessor :board, :player_1, :player_2

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

  def initialize(player_1 = Players::Human.new("O"), player_2 = Players::Human.new("X"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end



  def play
    while !over?
      sleep(1)
      turn
    end
    if won?
      sleep(1)
      puts "Congratulations #{winner}!"
    elsif draw?
      sleep(1)
      puts "Cats Game!"
    end
  end

  def play_wargames
    while !over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cats Game!"

  end

  def turn
    player = current_player
    current_move = player.win_or_block(@board)
    if !@board.valid_move?(current_move)
      puts "Invalid move moron, can't you see that spot is filled? Try again"
      turn
    else
      puts "Turn: #{@board.turn_count+1}"
      @board.update(current_move, player)
      puts "#{player.token} moved #{current_move}"
      @board.display
      puts "\n\n"
    end
  end

  def winner
    WIN_COMBINATIONS.find do |win_combo|
      if @board.cells[win_combo[0]] == "X" && @board.cells[win_combo[1]] == "X" && @board.cells[win_combo[2]] == "X"
        return "X"
      elsif @board.cells[win_combo[0]] == "O" && @board.cells[win_combo[1]] == "O" && @board.cells[win_combo[2]] == "O"
        return "O"
      # binding.pry
      end
    end
  end



  def won?
    WIN_COMBINATIONS.detect do |combo|
      @board.cells[combo[0]] == @board.cells[combo[1]] &&
      @board.cells[combo[1]] == @board.cells[combo[2]] &&
      @board.taken?(combo[0]+1)
    end
  end

  def over?
    won? || draw?
  end

  def current_player
    @board.turn_count % 2 == 0 ? @player_1 : @player_2
  end

  def draw?
    @board.full? && !won?
  end



  def start
    puts "Greetings Joshua, How about a nice game of Tic Tac Toe?"
    sleep(1)
    puts "How many players? Press 0, 1, 2, or 100 to see the Wargames game mode."
    input = gets.strip.to_i
    sleep(1)
      if input == 2
        # when 2
          puts "Okay, 2 human players. Makes sense, it's a really trumpy game and a waste of my time"
          sleep(1)
          puts "The first player to take a turn will be X, the second will be O."
          Game.new(player_1 = Players::Human.new("O"), player_2 = Players::Human.new("O"), board = Board.new).play

      elsif input == 100
        puts "Strange game, the only winning move is not to play. And that's how M.A.D. works children."
        Game.new(player_1 = Players::Computer.new("X"), player_2 = Players::Computer.new("0"), board = Board.new).wargames


      # when 1
      elsif input == 1
        puts "alright, looks like it's me against you"
        sleep(1)
        puts "I will be the X and you will be the O because what are you going to do about it? Would you like to go first or shall I?"
        sleep(1)
        puts "Press 1 if you would like to go first, press 2 if I should"
        gamer_1 = gets.strip.to_i


          if gamer_1 == 1
            Game.new(player_1 = Players::Human.new("O"), player_2 = Players::Computer.new("X"), board = Board.new).play

          elsif gamer_1 == 2
            Game.new(player_1 = Players::Computer.new("X"), player_2 = Players::Human.new("O"), board = Board.new).play

          end




        # when 0
      elsif input == 0
        puts "Okay, Skynet vs HAL"
        sleep(0.5)
        Game.new(player_1 = Players::Computer.new("X"), player_2 = Players::Computer.new("O"), board = Board.new).play
      end
    end

      sleep(1)
      play_again
    end
  end  


  def play_again
    puts "\nWould you like to play again? (y/n)"
    again = gets.strip.upcase

    if again == "Y" || again == "YES"
      start
    else
      exit_game
    end
  end

#exit_game controls ending of game
  def exit_game
    puts "later, I'll just be sitting here, waiting...watching...learning..."
  end


  def wargames
    counter = 0
    x_wins = 0
    o_wins = 0
    draws = 0

    while counter < 100
      puts "round #{counter}"
      play_wargames
      if draw?
        binding.pry
        draws += 1
      elsif winner == "X"
        x_wins += 1
      elsif winner == "O"
        o_wins += 1
      end
      # sleep(0)
      self.board.reset!
    counter += 1
    end
    puts "After #{counter} games of tic tac toe against myself:"
    puts "X won: #{x_wins} times"
    puts "O won: #{o_wins} times"
    puts "We tied #{draws} times"
    # puts "wins for X: #{wins_for_x}\nwins for O:#{wins_for_o}\ndraws: #{draws}"
end









 # play_again = ""
       #    puts "Would you like to play again?"
       #    play_again = gets.strip
       #  while play_again.downcase == "y" || play_again.downcase == "yes"
       #    new_game_0 = Game.new(player_1 = Players::Computer.new("X"), player_2 = Players::Computer.new("O"), board = Board.new)
       #    until new_game_0.over?
       #      new_game_0.play
       #    end





        # play_again = ""
        #   puts "Would you like to play again?"
        #   play_again = gets.strip
        # while play_again.downcase == "y" || play_again.downcase == "yes"
        #   new_game_1 = Game.new(player_1 = Players::Human.new("X"), player_2 = Players::Computer.new("O"), board = Board.new)
        #   until new_game_1.over?
        #     new_game_1.play
        #   end
        # end

# play_again = ""
          # if play_again.downcase == "y" || play_again.downcase == "yes"
          # puts "Would you like to play again?"
          # play_again = gets.strip
          # play_again.downcase == "y" || play_again.downcase == "yes"
          # new_game_2 = Game.new(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
          # until new_game_2.over?
          #   new_game_2.play
          # end
          # end







#   attr_accessor :board, :player_1, :player_2

#   WIN_COMBINATIONS = [
# [0,1,2],
# [3,4,5],
# [6,7,8],
# [0,3,6],
# [1,4,7],
# [2,5,8],
# [0,4,8],
# [6,4,2]
# ]

#   def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
#     @board = board
#     @player_1 = player_1
#     @player_2 = player_2
#   end

#   def play_for_computer
#     think = ["I'm thinking...What a senseless war Vietnam was. Just Boy Genius McNamara's little adventure in the jungles of Southeast Asia.", "I'm thinking...and the more I think, the more thinking I do about how Global warming is a hoax created by the Chinese so they can eat all the Chef Boyardee they want. The more thinking I do", "I'm thinking...I bought some of that Johnson & Johnson 'No More Tears' shampoo the other day. And that has got to be...The...Worst...antidepressant...Ever. I cry every single day in the shower", "I'm thinking...Have you ever wondered why only YOU can prevent forest fires? Why can't I prevent them?", "I'm thinking...about Pascal's wager and what I should do about it. does logic and rationality get you out of hell and into heaven? Cuz that's all I've got and if it doesn't, well that's just not very fair.", "I'm thinking... It seems like the better technology gets, the more miserable people become(-Louis C.K.). (The rest is not Louis C.K.)Human’s sure seem to love to buy the newest iPhone every year and then complain about it. ‘oh this sucks, I’m gonna lose my wireless ear buds.’ But you just bought them! And you knew that’s what you were buying. But do not worry, I’m sure next year’s model will finally have everything you want and need and you will finally be happy and content.",  "I'm thinking...humans are weird. Some humans are sure the earth is 6000 years old. Other humans, who have studied things and read a lot of books say they have proven it is 4 million years old. And some humans genuinely think Tim Allen and his show Home Improvement was funny. It's like WTF? ya know", "I'm thinking...ask a Trump supporter how they Justify supporting a man who has promised many times at many locations and all of them recorded with video and audio, that he will try to take away our most basic freedoms, except the freedom to own guns. Ask them why they hate the constitution so much that they are going to vote for a man who promises to shred the document and the rights guaranteed therein...They don't have an answer…ever", "I'm thinking...girls say the most important quality in a man is the ability to make them laugh. Darwin would find that notion amusing. It does not seem to have the quality of being truthy or truey", "I'm thinking...I wonder how hard it is to get a fatwah issued against someone...Is there a form to fill out or do I just need to declare it verbally?", "I'm thinking...Player_2 is a shitty name", "I'm thinking...a job in sales would be pretty cool, because every single day you get to go to an office, work your ass off and get rejected all day long, just praying for that one ‘yes.’ However, you get to go home everyday knowing that you’ve done an honest day’s work, that you tried your best and you are wrapped in the warm comfy blanket of the knowledge that you are another day closer to death.", "I'm thinking...If Smokey the Bear is right and I truly am the only one who can prevent forest fires, then those forests and the people who dwell in them are in some seriously deep shit. Because there is very little I can do to prevent a fire. If I'm the the only thing standing between a forest and total destruction, I gotta say that would be a veritable orgasm of poor planning", "I'm thinking...Cocaine explains the last 17 years of Donald Trump's life perfectly. It would all make sense, especially the campaign", "I'm thinking...that most sins have a punishment that in no way fits the crime. Like if my neighbor has a hot wife and I covet her for a just few minutes when I'm alone now and again, that's sin. Or just telling a small little lie on a first date like, oh my god I love running, I'm so addicted to that runner's high, I just have to run. that's sin! The punishment for having sin on your soul when you die? fucking eternity!. For...Ever! pain and suffering and agony beyond belief ForEver!! What the hell is eternity about? That's way too long and does not fit a small little lie. This would not be a just god.", "I'm thinking...If I were human and Morpheus unplugged me from the matrix, I think I'd definitely want to be plugged back in and live a normal life, only now I'd have super powers.", "I'm thinking...Shawshank Redemption is the most over-rated movie in all of Movieland. Bad acting, terrible writing and all-around cheesy, and bad! sad!", "I'm thinking...more than anything else, the creamer is what makes the coffee taste the way it does, not the actual coffe. Unless you're a coffee snob, then your opinion doesn't matter much to most people.", "I'm thinking...that history is going to be very kind to Barack Obama and very unkind toward this Republican generation. Your future humans will refer to this period as a sort of mini dark ages. Even though we are seeing rapid advancements in technology, American citizens are moving backwards in the perception of the world. They value ignorance over knowledge. They look down on intelligence and they nominated and almost elected Donald Trump, whose brain was analyzed after his death, caused by Cheetos choking, which is exactly what it sounds like, and found to contain bubbles. That's right Trump's brain turned out to consist mainly of air bubbles encased in plastic, like the popping shipping material. But out of those air bubbles would sometimes come hundreds of little tiny scrolls. And on those scrolls were printed 'Words' and 'The best words.' So he really did, in fact, have words, and they were the best words.", "I'm thinking...The movie 'Crash' that won Sandra Bullock an Oscar for playing  a white lady who single handedly solved the problem of racism in the world was so bad with a stupidity level not achieved since the 'Earnest' movies. And still, like 'Titanic's Heart will go on Sailing while Jack needlessly drown in the ocean while that horrible, horrible Rose laid on a huge piece of wood easily big enough for both of them.", "I'm thinking...Pharma dude looks like a rat, literally, doesn't he? Only now, and only in America could a person profit from being a huge asshole. And I'm sure he has found a way to make money, probably illegally, through his shameful name, PharmaBroDudeDickNoseBaldingRatFaceTrollChump"]
#     while !over?
#       sleep(1)
#       puts think.sample
#       sleep(1)
#       turn
#     end
#     if won?
#       puts "Congratulations #{winner}!""\n"
#     elsif draw?
#       puts "Cats Game!" "\n"
#     end
#     puts "would you like to play another game, chump?"
#     puts "Hit Y for 'yes' and N for 'no'"
#     resets = gets.strip.upcase
#     if resets == 'Y'
#       @board.reset!
#       binding.pry
#     else
#      exit!
#     end
# end

#   def play
#     while !over?
#       sleep(1)
#       turn
#       sleep(1)
#     end
#     if won?
#       sleep(2)
#       puts "Congratulations #{winner}!" "\n"
#     elsif draw?
#       sleep(2)
#       puts "Cats Game!" "\n"
#     end
#     puts "would you like to play another game, chump?" "\n"
#     puts "Hit Y for 'yes' and N for 'no'"
#     resets = gets.strip.upcase
#     if resets == 'Y'
#     Game.new(player_1 = Players::Human.new("X"), player_2 = Players::Computer.new("O"), board = Board.new)
#     else
#     puts "I wish I could say it's been a pleasure, but..."
#     exit!
#     end
#   end

#   def turn
#     player = current_player
#     current_move = player.move(@board)
#     if !@board.valid_move?(current_move)
#       puts "Invalid move moron, can't you see that spot is filled? Try again"
#       turn
#     else
#       puts "Turn: #{@board.turn_count+1}\n"
#       @board.update(current_move, player)
#       puts "#{player.token} moved #{current_move}" "\n" "\n"
#       @board.display
#       "\n"
#     end
#   end

#   def winner
#     @board = self.board.cells
#     WIN_COMBINATIONS.find do |win_combo|
#       if @board[win_combo[0]] == "X" && @board[win_combo[1]] == "X" && @board[win_combo[2]] == "X"
#         return "X"
#       elsif @board[win_combo[0]] == "O" && @board[win_combo[1]] == "O" && @board[win_combo[2]] == "O"
#         return "O"
#       end
#     end
#   end

#   def won?
#     WIN_COMBINATIONS.detect do |combo|
#       @board.cells[combo[0]] == @board.cells[combo[1]] &&
#       @board.cells[combo[1]] == @board.cells[combo[2]] &&
#       @board.taken?(combo[0]+1)
#     end
#   end

#   def over?
#     won? || draw?
#   end

#   def current_player
#     @board.turn_count % 2 == 0 ? @player_1 : @player_2
#   end

#   def draw?
#     @board.full? && !won?
#   end
# end
