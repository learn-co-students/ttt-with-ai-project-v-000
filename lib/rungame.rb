class Rungame

  def initialize
    #maybe some data to be passed in. #counter instance variable to add onto every time call is called to kick user out with too many invalid choices.
  end

  def valid_choice?(input)
    if input == "1 Player" || input == "2 Player"
      true
    else
      false
    end
  end

  def call
    puts "Welcome"

    puts "What kind of game is this? Please type: '1 Player' or '2 Player'"

    input = gets.strip


    if valid_choice?(input)
      "game commence"
    else
      puts "Please enter a valid choice like '1 Player' or '2 Player'"
      self.call # I want to start again from line: 10
    end

  end


end
