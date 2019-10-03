require 'pry'
# require_relative "../lib/players/human.rb"
class Game
  attr_accessor :player_1, :player_2, :board, :gets

    # puts "Please enter 1-9:"

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2],
  ]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new())
    @player_1 = player_1
    @player_2 = player_2
    @board = board
    # binding.pry
  end

  def current_player
    if board.turn_count % 2 == 0
      player_1
    else
      player_2
    end
  end

  def won?
    WIN_COMBINATIONS.each do |win_combination|

        win_index_1 = win_combination[0]
        win_index_2 = win_combination[1]
        win_index_3 = win_combination[2]

        position_1 = board.cells[win_index_1]
        position_2 = board.cells[win_index_2]
        position_3 = board.cells[win_index_3]

          if position_1 == "X" && position_2 == "X" && position_3 == "X"
              return win_combination
           elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
              return win_combination
          end
      end
      false
  end

  def draw?
      if board.full? == false
        false
      elsif won? == false
        true
      end
  end

  def over?
    if draw?
      true
    elsif won?
      true
    else false
    end
  end

  def winner
    WIN_COMBINATIONS.each do |win_combination|

      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]

      position_1 = board.cells[win_index_1]
      position_2 = board.cells[win_index_2]
      position_3 = board.cells[win_index_3]

      if position_1 == "X" && position_2 == "X" && position_3 == "X"
        return "X"
      elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
        return "O"
      end
    end
    return nil
  end

  # def turn
    # player = @player_1 || @player_2
    #
    #   # self.@player_1.move(@input)
    #   if !self.board.valid_move?(@input)
    #   self.board.update(@input, @player)
    # else
    #   turn
    # end

    def turn
    # puts "Please enter 1-9:"
      input = gets
      # board.position(input)
      if board.turn_count % 2 == 0
        player_1
      #  if player_1.move(input) != "1"
        if !board.valid_move?(input)
          player_1.move(input)
       end
     elsif board.turn_count % 2 != 0
        player_2
        # board.update(input, player_2)
      #  if player_2.move(input) != "2"
        if !board.valid_move?(input)
        #  !board.position(input)
          player_2.move(input)
       end
        # display_board
      # else
      #   turn
      end
      # binding.pry
    end



    # def turn
    # # puts "Please enter 1-9:"
    #   input = gets
    #   # index = input_to_index(input)
    #       # current_player == " "
    #       # if self.board.update(input, current_player)
    #     if current_player == player_1
    #       # board.valid_move?(input)
    #       if self.player_1.move(input) != "1"
    #          self.player_1.move(input)
    #       end
    #       # move(input)
    #     else turn
    #       self.board.update(input, current_player)
    #     # else self.board.update(input, current_player)
    #     # else current_player == player_2
    #         if self.player_2.move(input) != "2"
    #          self.player_2.move(input)
    #         end
    #       end
    #     # end
    #     # binding.pry
    #   end

      # this is good up to line 39
      # input = gets
      # if self.player_1.move(input) != "1"
      #   self.player_1.move(input)
      # # else self.board.update(input, player)
      # end
      # binding.pry
    # if self.board.valid_move?(input) != "1"
    #   self.board.valid_move?(input)
    # # self.board.update(input, player)
    # # else
    # #   turn
    # end

    # binding.pry
    # if self.player_1.move(gets) != "1"
    #   #  self.player_1.move(input)
    #    turn
    # else self.player_2.move(input)
    #   binding.pry
    # end

    # if self.board.valid_move?(input) != "1"
    #   # self.player_1.move(input)
    #   # turn
    # end

    #  if self.board.position(input) != "1"
    # end
  # end

  # binding.pry
  #valid_move? will ensure that moves are between 1-9 and not taken.

  # ) Game turn makes valid moves
  #    Failure/Error: expect(game.player_1).to receive(:gets).and_return("1")
  #      (#<Players::Human:0x0000000003522df0 @token="X">).gets(*(any args))
  #          expected: 1 time with any arguments
  #          received: 0 times with any arguments
  #    # ./spec/04_game_spec.rb:179:in `block (3 levels) in <top (required)>'

end
