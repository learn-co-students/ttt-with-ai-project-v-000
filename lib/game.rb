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

    # user = gets.chomp
    # case user
    # when "list songs"
    #   list_songs
    # when "list artists"
    #   list_artists
    # when "list genres"
    #   list_genres
    # when "list artist"
    #   list_songs_by_artist
    # when "list genre"
    #   list_songs_by_genre
    # when "play song"
    #   play_song
    # end

  def turn
    # input = gets
    # case input
    # when self.player_1.move(input)
    #   self.player_1.move(input)
    # end

    if self.player_1.move(gets) != "1"
      turn
    end
    


    # binding.pry
    # if self.player_1.move(gets) != "1"
    #   #  self.player_1.move(input)
    #    turn
    #
    #   end
      # binding.pry
    # else self.player_2.move(input)
    #   binding.pry
    # end
      # turn
    # until self.player_1.move(input) == "2"
    # # if self.player_2.move(input) != "2"
    #   self.player_2.move(input)
    # end
      # turn
    # else
    #   self.player_2.move(input) == "2"
    #   input

      # turn
      # binding.pry
    # end

    # if self.board.valid_move?(input) != "1"
    #   self.player_1.move(input)
    #   # turn
    # end
    # return input
    #  if self.board.position(input) == "1"
      #  return input

    # binding.pry

  end

  # if valid_move?(input)
  #     move(input, current_player)
  #
  #     display_board
  #   else
  #     turn
  #   end

  # binding.pry
  #valid_move? will ensure that moves are between 1-9 and not taken.

  # ) Game turn makes valid moves
  #    Failure/Error: expect(game.player_1).to receive(:gets).and_return("1")
  #      (#<Players::Human:0x0000000003522df0 @token="X">).gets(*(any args))
  #          expected: 1 time with any arguments
  #          received: 0 times with any arguments
  #    # ./spec/04_game_spec.rb:179:in `block (3 levels) in <top (required)>'

end
