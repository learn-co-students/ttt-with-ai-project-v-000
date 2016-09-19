require 'pry'

module Players
    class Computer < Player
        
        def self_winning?
            if has_move("2") && has_move("3") && !self.game.board.taken?("1")
                "1"
            elsif has_move("4") && has_move("7") && !self.game.board.taken?("1")
                "1"
            elsif has_move("5") && has_move("9") && !self.game.board.taken?("1")
                "1"
            elsif has_move("1") && has_move("3") && !self.game.board.taken?("2")
                "2"
            elsif has_move("5") && has_move("8") && !self.game.board.taken?("2")
                "2"
            elsif has_move("1") && has_move("2") && !self.game.board.taken?("3")
                "3"
            elsif has_move("6") && has_move("9") && !self.game.board.taken?("3")
                "3"
            elsif has_move("5") && has_move("7") && !self.game.board.taken?("3")
                "3"
            elsif has_move("5") && has_move("6") && !self.game.board.taken?("4")
                "4"
            elsif has_move("1") && has_move("7") && !self.game.board.taken?("4")
                "4"
            elsif has_move("6") && has_move("4") && !self.game.board.taken?("5")
                "5"
            elsif has_move("2") && has_move("8") && !self.game.board.taken?("5")
                "5"
            elsif has_move("1") && has_move("9") && !self.game.board.taken?("5")
                "5"
            elsif has_move("3") && has_move("7") && !self.game.board.taken?("5")
                "5"
            elsif has_move("4") && has_move("5") && !self.game.board.taken?("6")
                "6"
            elsif has_move("3") && has_move("9") && !self.game.board.taken?("6")
                "6"
            elsif has_move("8") && has_move("9") && !self.game.board.taken?("7")
                "7"
            elsif has_move("1") && has_move("4") && !self.game.board.taken?("7")
                "7"
            elsif has_move("3") && has_move("5") && !self.game.board.taken?("7")
                "7"
            elsif has_move("7") && has_move("9") && !self.game.board.taken?("8")
                "8"
            elsif has_move("2") && has_move("5") && !self.game.board.taken?("8")
                "8"
            elsif has_move("7") && has_move("8") && !self.game.board.taken?("9")
                "9"
            elsif has_move("3") && has_move("3") && !self.game.board.taken?("9")
                "9"
            elsif has_move("1") && has_move("5") && !self.game.board.taken?("9")
                "9"
            else
                false
            end
        end
        
        def opponent_winning?
            if opponent_has_move("2") && opponent_has_move("3") && !self.game.board.taken?("1")
                "1"
            elsif opponent_has_move("4") && opponent_has_move("7") && !self.game.board.taken?("1")
                "1"
            elsif opponent_has_move("5") && opponent_has_move("9") && !self.game.board.taken?("1")
                "1"
            elsif opponent_has_move("1") && opponent_has_move("3") && !self.game.board.taken?("2")
                "2"
            elsif opponent_has_move("5") && opponent_has_move("8") && !self.game.board.taken?("2")
                "2"
            elsif opponent_has_move("1") && opponent_has_move("2") && !self.game.board.taken?("3")
                "3"
            elsif opponent_has_move("6") && opponent_has_move("9") && !self.game.board.taken?("3")
                "3"
            elsif opponent_has_move("5") && opponent_has_move("7") && !self.game.board.taken?("3")
                "3"
            elsif opponent_has_move("5") && opponent_has_move("6") && !self.game.board.taken?("4")
                "4"
            elsif opponent_has_move("1") && opponent_has_move("7") && !self.game.board.taken?("4")
                "4"
            elsif opponent_has_move("6") && opponent_has_move("4") && !self.game.board.taken?("5")
                "5"
            elsif opponent_has_move("2") && opponent_has_move("8") && !self.game.board.taken?("5")
                "5"
            elsif opponent_has_move("1") && opponent_has_move("9") && !self.game.board.taken?("5")
                "5"
            elsif opponent_has_move("3") && opponent_has_move("7") && !self.game.board.taken?("5")
                "5"
            elsif opponent_has_move("4") && opponent_has_move("5") && !self.game.board.taken?("6")
                "6"
            elsif opponent_has_move("3") && opponent_has_move("9") && !self.game.board.taken?("6")
                "6"
            elsif opponent_has_move("8") && opponent_has_move("9") && !self.game.board.taken?("7")
                "7"
            elsif opponent_has_move("1") && opponent_has_move("4") && !self.game.board.taken?("7")
                "7"
            elsif opponent_has_move("3") && opponent_has_move("5") && !self.game.board.taken?("7")
                "7"
            elsif opponent_has_move("7") && opponent_has_move("9") && !self.game.board.taken?("8")
                "8"
            elsif opponent_has_move("2") && opponent_has_move("5") && !self.game.board.taken?("8")
                "8"
            elsif opponent_has_move("7") && opponent_has_move("8") && !self.game.board.taken?("9")
                "9"
            elsif opponent_has_move("3") && opponent_has_move("3") && !self.game.board.taken?("9")
                "9"
            elsif opponent_has_move("1") && opponent_has_move("5") && !self.game.board.taken?("9")
                "9"
            else
                false
            end
        end
                
        def has_move(input)
            self.moves.include?(input)
        end

        def opponent
            @game.not_current_player
        end
        
        def opponent_has_move(input)
            self.opponent.moves.include?(input) 
        end
        
        def choose_move(board)
            possible_moves = ["5", "1", "7", "3", "9", "2", "4", "6", "8"]
            my_move = possible_moves.find {|move| !board.taken?(move)}
            my_move
        end
        
        def move(board)
            sleep 0.5
            if self.game.class == Game && self.opponent_winning?
                self.opponent_winning?
            elsif self.self_winning?
                self.self_winning?
            else
                choose_move(board)
            end
        end
    end
end