require 'pry'

module Players
    class Computer < Player
        
        attr_accessor :player_1, :player_2, :board, :computer, :game
        #  :current_player

        def initialize(player_1 = Players::Computer.new("X"), player_2 = Players::Human.new("O"))
            @player_1 = player_1
            @player_2 = player_2

            binding.pry
        end

        def move(board)
            [1, 2, 3, 4, 5, 6, 7, 8, 9].find {|i| !board.taken?(i)}.to_s
        end 
                
        def computer_turn(board)
            move(board)

            board.play
        end

        
        def computer_moves
        end

    end
end
       

            
                        # 1 -- 5

        # 2 -- if 1, 9
        #     if 2, 7
        #     if 3, 7
        #         if 4, 9
        #             if 6, 1
        #                 if 7, 3
        #                     if 8, 3
        #                         if 9, 1 
        # 3 -- 

        # if 2, 3
        #     if 1, 3
        #         if 4, 1
        #             if 3 1
        #                 if 7, 9
        #                     if 8, 9
        #                         if 6, 7
        #                             if 9, 6

        # 4 --

        # if 4, 6
        #     if 2, 9
        #         if 1, 6
        #             if 7, 8
        #                 if 8, 7

        # 5 --

        # if 6, 2


            
            
            # in this the current player needs to be both the computer and the human
            # so player 1 will always be the computer and player 2 will always be the human
            # player 1 will go first
            # @player 2, the human has a choice and goes (turn)
            # then player 1 goes with the first set of conditional statements (to be coded frm below)
            # then player 2 goes until the game is won (part of game.play)




       
        # 1-player game ... 

        # computer goes first 
        # so input is what I tell it for the first ... no user input till second





        # 1 player game

        # 1 -- 5

        # 2 -- if 1, 9
        #     if 2, 7
        #     if 3, 7
        #         if 4, 9
        #             if 6, 1
        #                 if 7, 3
        #                     if 8, 3
        #                         if 9, 1 
        # 3 -- 

        # if 2, 3
        #     if 1, 3
        #         if 4, 1
        #             if 3 1
        #                 if 7, 9
        #                     if 8, 9
        #                         if 6, 7
        #                             if 9, 6

        # 4 --

        # if 4, 6
        #     if 2, 9
        #         if 1, 6
        #             if 7, 8
        #                 if 8, 7

        # 5 --

        # if 6, 2

        # 3 -- 

        # 4 -- if @cells = [" ", " ", " ", " ", "X", " ", " ", " ", " "],
        #     if @cells = [" ", " ", " ", " ", "X", " ", " ", " ", " "],
        #     if @cells = [" ", " ", " ", " ", "X", " ", " ", " ", " "],
        #     if @cells = [" ", " ", " ", " ", "X", " ", " ", " ", " "],
        #     if @cells = [" ", " ", " ", " ", "X", " ", " ", " ", " "],
        #     if @cells = [" ", " ", " ", " ", "X", " ", " ", " ", " "],
        #     if @cells = [" ", " ", " ", " ", "X", " ", " ", " ", " "],
        #     if @cells = [" ", " ", " ", " ", "X", " ", " ", " ", " "],
        #     if @cells = [" ", " ", " ", " ", "X", " ", " ", " ", " "],
   
        # 5 -- if @cells = [" ", " ", " ", " ", "X", " ", " ", " ", " "],
        # if @cells = [" ", " ", " ", " ", "X", " ", " ", " ", " "],
        #     if @cells = [" ", " ", " ", " ", "X", " ", " ", " ", " "],
        #     if @cells = [" ", " ", " ", " ", "X", " ", " ", " ", " "],
        #     if @cells = [" ", " ", " ", " ", "X", " ", " ", " ", " "],
        #     if @cells = [" ", " ", " ", " ", "X", " ", " ", " ", " "],
        #     if @cells = [" ", " ", " ", " ", "X", " ", " ", " ", " "],
        #     if @cells = [" ", " ", " ", " ", "X", " ", " ", " ", " "],
        #     if @cells = [" ", " ", " ", " ", "X", " ", " ", " ", " "],

        # 6 -- if @cells = [" ", " ", " ", " ", "X", " ", " ", " ", " "],
        # if @cells = [" ", " ", " ", " ", "X", " ", " ", " ", " "],
        #     if @cells = [" ", " ", " ", " ", "X", " ", " ", " ", " "],
        #     if @cells = [" ", " ", " ", " ", "X", " ", " ", " ", " "],
        #     if @cells = [" ", " ", " ", " ", "X", " ", " ", " ", " "],
        #     if @cells = [" ", " ", " ", " ", "X", " ", " ", " ", " "],
        #     if @cells = [" ", " ", " ", " ", "X", " ", " ", " ", " "],
        #     if @cells = [" ", " ", " ", " ", "X", " ", " ", " ", " "],
        #     if @cells = [" ", " ", " ", " ", "X", " ", " ", " ", " "],
       
        # 7 -- if @cells = [" ", " ", " ", " ", "X", " ", " ", " ", " "],
        #     if @cells = [" ", " ", " ", " ", "X", " ", " ", " ", " "],
        #     if @cells = [" ", " ", " ", " ", "X", " ", " ", " ", " "],
        #     if @cells = [" ", " ", " ", " ", "X", " ", " ", " ", " "],
        #     if @cells = [" ", " ", " ", " ", "X", " ", " ", " ", " "],
        #     if @cells = [" ", " ", " ", " ", "X", " ", " ", " ", " "],
        #     if @cells = [" ", " ", " ", " ", "X", " ", " ", " ", " "],
        #     if @cells = [" ", " ", " ", " ", "X", " ", " ", " ", " "],
        #     if @cells = [" ", " ", " ", " ", "X", " ", " ", " ", " "],

        # 8 -- if @cells = [" ", " ", " ", " ", "X", " ", " ", " ", " "],
        #     if @cells = [" ", " ", " ", " ", "X", " ", " ", " ", " "],
        #     if @cells = [" ", " ", " ", " ", "X", " ", " ", " ", " "],
        #     if @cells = [" ", " ", " ", " ", "X", " ", " ", " ", " "],
        #     if @cells = [" ", " ", " ", " ", "X", " ", " ", " ", " "],
        #     if @cells = [" ", " ", " ", " ", "X", " ", " ", " ", " "],
        #     if @cells = [" ", " ", " ", " ", "X", " ", " ", " ", " "],
        #     if @cells = [" ", " ", " ", " ", "X", " ", " ", " ", " "],
        #     if @cells = [" ", " ", " ", " ", "X", " ", " ", " ", " "],
           
        # 9 -- if @cells = [" ", " ", " ", " ", "X", " ", " ", " ", " "],
        #     if @cells = [" ", " ", " ", " ", "X", " ", " ", " ", " "],
        #     if @cells = [" ", " ", " ", " ", "X", " ", " ", " ", " "],
        #     if @cells = [" ", " ", " ", " ", "X", " ", " ", " ", " "],
        #     if @cells = [" ", " ", " ", " ", "X", " ", " ", " ", " "],
        #     if @cells = [" ", " ", " ", " ", "X", " ", " ", " ", " "],
        #     if @cells = [" ", " ", " ", " ", "X", " ", " ", " ", " "],
        #     if @cells = [" ", " ", " ", " ", "X", " ", " ", " ", " "],
        #     if @cells = [" ", " ", " ", " ", "X", " ", " ", " ", " "],
        
    
    
               
       




        # computer goes first 

        # 2 player game

        # just encapsulate


        
    
  

