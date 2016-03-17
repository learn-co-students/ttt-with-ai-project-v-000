require 'spec_helper'

describe "GameCLI" do

  # What are the GameCLI responsibilities?
  # 
  # - it should welcome to the players
  # - it should get input from users about how many human players in the game
  # - it should create a Game with the conditions input by player and let it run.
  # - it should ask user if they want to play again and ask hwo many human players.

  # Not to self: running tests fo CLI with '0' for 2 computer players or it 
  # goes crazy because of the human gets calls not being answered.

  # Also how do I clean up the :puts output on the rest suite when 'new' is called
  # on GameCLI?

  describe 'GameCLI Controller' do
    it 'welcomes user to game and asks them how many human players will play' do
      gamecli = GameCLI.new
      expect(GameCLI).to receive(:new).and_return(gamecli)
      expect(gamecli).to receive(:gets).and_return("0")

      output = capture_puts {run_file("./bin/tictactoe")}
    end

    it 'only allows user to input a valid number of human players' do
      #expect invalid input (3) to result in error message and gets prompt
      gamecli = GameCLI.new
      expect(GameCLI).to receive(:new).and_return(gamecli)
      expect(gamecli).to receive(:gets).and_return("5", "4", "0")

      output = capture_puts {run_file("./bin/tictactoe")}

      expect(output).to include('Sorry, this game only allows 0 to 2 human players!')
      expect(output).to include('Sorry, this game only allows 0 to 2 human players!')
    end

    it 'calls a games passing to the game the # of players the user input' do
      gamecli = GameCLI.new
      expect(GameCLI).to receive(:new).and_return(gamecli)
      expect(gamecli).to receive(:gets).and_return("0")

      output = capture_puts {run_file("./bin/tictactoe")}

      expect(output).to include('please choose a move')
    end

    it 'should ask players to play again once a game is finished' do
    end
  end
end