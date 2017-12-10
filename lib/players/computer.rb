require 'pry'

module Players
    class Computer < Player
        
        attr_accessor :player_1, :player_2, :board, :computer

        def initialize(computer)
            @computer = computer
        end

        def move(board)
            [1, 2, 3, 4, 5, 6, 7, 8, 9].find {|i| !board.taken?(i)}.to_s
        end 

        def computer_turn
            board.turn = board.cells[5]
            board.display
        end
    end
end
       
       
        # 1-player game ... 

        # computer goes first 
        # so input is what I tell it for the first ... no user input till second

    # def one_player_game
    #     puts ""
    # end



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


        
    
  

