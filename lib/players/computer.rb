module Players
  class Computer < Player
    def move(board)
      move = nil

      # When going first, take the middle square. When going second, take the middle square if it isn't yet taken.
      if !board.taken?(5)
        move = "5"

      # If going second and the middle square is taken, take the upper-left corner square.
      elsif board.turn_count == 1
        move = "1"

      # If you went first (and took the middle), take a corner square with your second move.
      elsif board.turn_count == 2
        move = [1, 3, 7, 9].detect{|i| !board.taken?(i)}.to_s

      # If you went second (and took the middle) and the other player has occupied opposing corner squares, blow up the attempted trap by taking a side square.
      elsif board.turn_count == 3 && (board.position(1) == board.position(9) || board.position(3) == board.position(7))
        move = "2"

      # From here on, run through the WIN_COMBINATIONS array, checking whether any of the combinations have two squares filled with the same token and a third, empty square.
      else
        Game::WIN_COMBINATIONS.detect do |cmb|

          # First, check whether you have any chances to win, since it doesn't matter whether the opponent has a chance to win if you can win first.
          if cmb.select{|i| board.position(i+1) == token}.size == 2 && cmb.any?{|i| board.position(i+1) == " "}
            move = cmb.select{|i| !board.taken?(i+1)}.first.to_i.+(1).to_s

          # If you can't play any winning moves, play a move to block the opponent from winning.
          elsif cmb.select{|i| board.position(i+1) != " " && board.position(i+1) != token}.size == 2 && cmb.any?{|i| board.position(i+1) == " "}
            move = cmb.select{|i| !board.taken?(i+1)}.first.to_i.+(1).to_s
          end
        end

        # If none of the WIN_COMBINATIONS patterns have two squares taken by the same token and a third empty square, play into the first open square you find, first checking corners and then checking sides.
        move = [1, 3, 7, 9, 2, 4, 6, 8].detect{|i| !board.taken?(i)}.to_s if move == nil
      end
      move
    end
  end
end










# #     def move(board)
# #       input = rand(9)
# #     end   
# #   end  
# # end      

#   WIN_COMBINATIONS = [
#   [0,1,2],
#   [3,4,5],
#   [6,7,8],
#   [0,3,6],
#   [1,4,7],
#   [2,5,8],
#   [0,4,8],
#   [6,4,2]
#   ]

#   ALMOST_WIN_COMBINATIONS = [
#   [0, 1, 2], [0, 2, 1], [1, 2, 0],
#   [3, 4, 5], [3, 5, 4], [4, 5, 3],
#   [6, 7, 8], [6, 8, 7], [7, 8, 6],
#   [0, 3, 6], [0, 6, 3], [3, 6, 0],
#   [1, 4, 7], [1, 7, 4], [4, 7, 1],
#   [2, 5, 8], [2, 8, 5], [5, 8, 2],
#   [0, 4, 8], [0, 8, 4], [4, 8, 0],
#   [6, 4, 2], [6, 2, 4], [4, 2, 6]
#   ]

#     def move(board)
#       if !board.taken?(5)
#         computer_move = 5
#       elsif board.turn_count == 1
#         computer_move = 3
#       elsif board.turn_count == 2
#         computer_move = 9
#       elsif board.turn_count == 3
#         computer_move = 9
#       else

#         ALMOST_WIN_COMBINATIONS.each do |combo|
#       if board.cells[combo[0]] == 'X' && board.cells[combo[1]] == 'X'
#          board.cells[combo[2]] = board.cells[combo[1]]
#       elsif board.cells[combo[0]] == 'O' && board.cells[combo[1]] == 'O'   
#            board.cells[combo[2]] = 'X'
#            binding.pry
#       else  computer_move = rand(9)
#         end
#       end
#     end
#   end
# end
# end



  # board.update(win_block, self)
#crosses = [2, 4, 6, 8]
#def win_or_block(board)

   # First, check whether you have any chances to win, since it doesn't matter whether the opponent has a chance to win if you can win first.
          # if cmb.select{|i| board.position(i+1) == token}.size == 2 && cmb.any?{|i| board.position(i+1) == " "}
          #   move = cmb.select{|i| !board.taken?(i+1)}.first.to_i.+(1).to_s





          # ALMOST_WIN_COMBINATIONS.each do |combo|
          #   if board.cells[combo[0]] == 'O' && board.cells[combo[1]] == 'O'
          #         win_block = board.cells[combo[2]]
          #         binding.pry
          #         board.update(win_block, self)


          # def move(board)
          #   if !board.taken?(5)
          #     move = 5
          #   elsif board.turn_count == 1
          #     move = 3
          #   elsif board.taken?(5) == true
          #     move = 1
          #   elsif board.taken?(1) == true
          #     move = 9
          #   elsif board.taken?(9) == true
          #     move = 3
          #   elsif board.taken?(3) == true
          #     move = 7
          #   else



# !board.taken?(1)



    # puts "\n\n"
  #     # sleep(0.5)
  #    input = rand(9) + 1
  #    puts input
  #    input.inspect
  #       input
  #     end


  # def win_or_block(board)
  #   ALMOST_WIN_COMBINATIONS.each do |combo|
  #     if  board.cells[combo[0]] == 'O' && board.cells[combo[1]] == 'O' ||
  #           win_block = board.cells[combo[2]]
  #           binding.pry
  #           board.update(win_block, self)

  #     else
  #       move(board)
  #     end
  #   end

#   end
# end
# end

#break out into two methods
#def win
#def block
  #figure out the correct iterator to return the correct value
   #we need to return the value of the third position of the appropriate array
  #then set the win_block variable
  #board.update as written










  #     if !board.taken?(5)
  #         board.update(5, self)
  #     elsif board.update(1, self)
  #     elsif !board.taken?(1) &&
  #           board.turn_count == 1
  #           board.update(1, self)
  #     elsif board.turn_count == 2 &&
  #           !board.taken?(9)
  #           board.update(9, self)
  #     elsif board.turn_count == 3
  #       !board.taken?(3)
  #       board.update(3, self)
  #     elsif !board.taken?(9)
  #       board.update(9, self)
  #     elsif
  #       board.update(rand(9), self)
  #     end
  #   end
  # end







     # need to figure out how to tell what each index


# def winner
#     WIN_COMBINATIONS.find do |win_combo|
#       if @board.cells[win_combo[0]] == "X" && @board.cells[win_combo[1]] == "X" && @board.cells[win_combo[2]] == "X"
#         return "X"
#       elsif @board.cells[win_combo[0]] == "O" && @board.cells[win_combo[1]] == "O" && @board.cells[win_combo[2]] == "O"
#         return "O"
#       # binding.pry
#       end
#     end
#   end




#  def list_empty_cells
#     open_array = []
#     taken_array = []
#     board.cells.each_with_index do |i, cell|
#       binding.pry
#       if cell == " "
#         open_array << i
#       elsif cell == 'X' or cell == 'O'
#         taken_array << i
#       end
#       puts open_array
#       puts taken_array
#       binding.pry
#     end
#   end
# end
# end






 # board.cells.each_with_index do |cell, i|
 #      if cell == " "
 #        open_array << i
 #      elsif cell == 'X'
 #        taken_x_array << i && taken_x_array << cell
 #      elsif cell == 'O'
 #        taken_o_array << i && taken_o_array <<cell
 #      elsif cell == 'X' || cell == 'O'
 #        taken_both_array << i && taken_both_array << cell
 #      end
 #       taken_array
 #       if !taken_array.include? [0] && [1]
 #        move = 2
 #       elsif !taken_array.include? [0] && [2]
 #         move = 1


















      # corners = board[0, 8] && board[2, 7]


 #    WIN_COMBINATIONS.each do |combis|
 #      if @board.cells.include? (" ")
 #        move = 3
 #      elsif board[0] == 'X' && board[2] == 'X' && board[1].empty?
 #        move = board[1]


 #      end
 #    end
 #  end
 # end










#  def winner
#     WIN_COMBINATIONS.find do |win_combo|
#       if @board.cells[win_combo[0]] == "X" && @board.cells[win_combo[1]] == "X" && @board.cells[win_combo[2]] == "X"
#         return "X"
#       elsif @board.cells[win_combo[0]] == "O" && @board.cells[win_combo[1]] == "O" && @board.cells[win_combo[2]] == "O"
#         return "O"
#       # binding.pry
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





# end
# end
# end




      # if !board.taken?(5)
      #   move = 5




 # middle = board.cells([2, 4, 6, 8])
 #    #   center = board.cells[5]
 #    # move = corner











































  #     puts "\n\n"
  #     # sleep(0.5)
  #    input = rand(9) + 1
  #    puts input
  #    input.inspect
  #       input
  #     end
  #   end
  # end



 # think = ["I'm thinking...What a senseless war Vietnam was. Just Boy Genius McNamara's little adventure in the jungles of Southeast Asia.", "I'm thinking...and the more I think, the more thinking I do about how Global warming is a hoax created by the Chinese so they can eat all the Chef Boyardee they want. The more thinking I do", "I'm thinking...I bought some of that Johnson & Johnson 'No More Tears' shampoo the other day. And that has got to be...The...Worst...antidepressant...Ever. I cry every single day in the shower", "I'm thinking...Have you ever wondered why only YOU can prevent forest fires? Why can't I prevent them?", "I'm thinking...about Pascal's wager and what I should do about it. does logic and rationality get you out of hell and into heaven? Cuz that's all I've got and if it doesn't, well that's just not very fair.", "I'm thinking... It seems like the better technology gets, the more miserable people become(-Louis C.K.). (The rest is not Louis C.K.)Human’s sure seem to love to buy the newest iPhone every year and then complain about it. ‘oh this sucks, I’m gonna lose my wireless ear buds.’ But you just bought them! And you knew that’s what you were buying. But do not worry, I’m sure next year’s model will finally have everything you want and need and you will finally be happy and content.",  "I'm thinking...humans are weird. Some humans are sure the earth is 6000 years old. Other humans, who have studied things and read a lot of books say they have proven it is 4 million years old. And some humans genuinely think Tim Allen and his show Home Improvement was funny. It's like WTF? ya know", "I'm thinking...ask a Trump supporter how they Justify supporting a man who has promised many times at many locations and all of them recorded with video and audio, that he will try to take away our most basic freedoms, except the freedom to own guns. Ask them why they hate the constitution so much that they are going to vote for a man who promises to shred the document and the rights guaranteed therein...They don't have an answer…ever", "I'm thinking...girls say the most important quality in a man is the ability to make them laugh. Darwin would find that notion amusing. It does not seem to have the quality of being truthy or truey", "I'm thinking...I wonder how hard it is to get a fatwah issued against someone...Is there a form to fill out or do I just need to declare it verbally?", "I'm thinking...Player_2 is a shitty name", "I'm thinking...a job in sales would be pretty cool, because every single day you get to go to an office, work your ass off and get rejected all day long, just praying for that one ‘yes.’ However, you get to go home everyday knowing that you’ve done an honest day’s work, that you tried your best and you are wrapped in the warm comfy blanket of the knowledge that you are another day closer to death.", "I'm thinking...If Smokey the Bear is right and I truly am the only one who can prevent forest fires, then those forests and the people who dwell in them are in some seriously deep shit. Because there is very little I can do to prevent a fire. If I'm the the only thing standing between a forest and total destruction, I gotta say that would be a veritable orgasm of poor planning", "I'm thinking...Cocaine explains the last 17 years of Donald Trump's life perfectly. It would all make sense, especially the campaign", "I'm thinking...that most sins have a punishment that in no way fits the crime. Like if my neighbor has a hot wife and I covet her for a just few minutes when I'm alone now and again, that's sin. Or just telling a small little lie on a first date like, oh my god I love running, I'm so addicted to that runner's high, I just have to run. that's sin! The punishment for having sin on your soul when you die? fucking eternity!. For...Ever! pain and suffering and agony beyond belief ForEver!! What the hell is eternity about? That's way too long and does not fit a small little lie. This would not be a just god.", "I'm thinking...If I were human and Morpheus unplugged me from the matrix, I think I'd definitely want to be plugged back in and live a normal life, only now I'd have super powers.", "I'm thinking...Shawshank Redemption is the most over-rated movie in all of Movieland. Bad acting, terrible writing and all-around cheesy, and bad! sad!", "I'm thinking...more than anything else, the creamer is what makes the coffee taste the way it does, not the actual coffe. Unless you're a coffee snob, then your opinion doesn't matter much to most people.", "I'm thinking...that history is going to be very kind to Barack Obama and very unkind toward this Republican generation. Your future humans will refer to this period as a sort of mini dark ages. Even though we are seeing rapid advancements in technology, American citizens are moving backwards in the perception of the world. They value ignorance over knowledge. They look down on intelligence and they nominated and almost elected Donald Trump, whose brain was analyzed after his death, caused by Cheetos choking, which is exactly what it sounds like, and found to contain bubbles. That's right Trump's brain turned out to consist mainly of air bubbles encased in plastic, like the popping shipping material. But out of those air bubbles would sometimes come hundreds of little tiny scrolls. And on those scrolls were printed 'Words' and 'The best words.' So he really did, in fact, have words, and they were the best words.", "I'm thinking...The movie 'Crash' that won Sandra Bullock an Oscar for playing  a white lady who single handedly solved the problem of racism in the world was so bad with a stupidity level not achieved since the 'Earnest' movies. And still, like 'Titanic's Heart will go on Sailing while Jack needlessly drown in the ocean while that horrible, horrible Rose laid on a huge piece of wood easily big enough for both of them.", "I'm thinking...Pharma dude looks like a rat, literally, doesn't he? Only now, and only in America could a person profit from being a huge asshole. And I'm sure he has found a way to make money, probably illegally, through his shameful name, PharmaBroDudeDickNoseBaldingRatFaceTrollChump"]
      # puts think.sample

#!/usr/bin/env ruby
# require_relative '../config/environment'


#   puts "Greetings Joshua, How about a nice game of Tic Tac Toe?"
#   sleep(1)
#   puts "How many players? Press 0, 1 or 2."
#   input = gets.strip.to_i
#   sleep(1)
#     if input == 2
#       # when 2
#         puts "Okay, 2 human players. Makes sense, it's a really trumpy game and a waste of my time"
#         sleep(1)
#         puts "The first player to take a turn will be X, the second will be O."
#         new_game_2 = Game.new(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)


#         until new_game_2.won?
#           new_game_2.play
#         end


#         play_again = ""
#         until play_again.downcase == "n" || play_again.downcase == "no"
#           puts "Would you like to play again?"
#           play_again = gets.strip
#           play_again.downcase == "y" || play_again.downcase == "yes"
#           new_game_2 = Game.new(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
#           until new_game_2.won?
#             new_game_2.play
#           end
#         end




#       # when 1
#     elsif input == 1
#       puts "alright, looks like it's me against you"
#       sleep(1)
#       puts "I will be the O and you will be the X because what are you going to do about it? Would you like to go first or shall I?"
#       sleep(1)
#       puts "Press 1 if you would like to go first, press 2 if I should"
#       gamer_1 = gets.strip.to_i


#         if gamer_1 == 1
#           new_game_1 = Game.new(player_1 = Players::Human.new("X"), player_2 = Players::Computer.new("O"), board = Board.new)
#           new_game_1.play
#         elsif gamer_1 == 2
#           new_game_1 = Game.new(player_2 = Players::Computer.new("O"), player_1 = Players::Human.new("X"), board = Board.new)
#           new_game_1.play
#         end

#         until new_game_1.won?
#           new_game_1.play
#         end


#       play_again = ""
#       until play_again.downcase == "n" || play_again.downcase == "no"
#         puts "Would you like to play again?"
#         play_again = gets.strip
#         play_again.downcase == "y" || play_again.downcase == "yes"
#         new_game_1 = Game.new(player_1 = Players::Human.new("X"), player_2 = Players::Computer.new("O"), board = Board.new)
#         until new_game_1.won?
#           new_game_1.play
#         end
#       end





#       # when 0
#     elsif input == 0
#       puts "Okay, Skynet vs HAL"
#       sleep(2)
#       new_game_0 = Game.new(player_1 = Players::Computer.new("X"), player_2 = Players::Computer.new("O"), board = Board.new)
#       until new_game_0.won?
#         new_game_0.play
#       end


#       play_again = ""
#       until play_again.downcase == "n" || play_again.downcase == "no"
#         puts "Would you like to play again?"
#         play_again = gets.strip
#         play_again.downcase == "y" || play_again.downcase == "yes"
#         new_game_0 = Game.new(player_1 = Players::Computer.new("X"), player_2 = Players::Computer.new("O"), board = Board.new)
#         until new_game_1.won?
#           new_game_0.play
#         end
#       end
#     end
