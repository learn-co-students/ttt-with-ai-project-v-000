class Wargames
  attr_accessor :input_output
  def display_scores
    self.input_output.display "SCORES of WARGAMES are:"
    self.input_output.display "Number of Games Won: #{@games.count(&:won?)}"
    self.input_output.display "Number of Games Lost: #{@games.count(&:lost?)}"
    self.input_output.display "Number of Games Draw: #{@games.count(&:draw?)}"
    self.input_output.display "\n\n"
  end

  def initialize(io = InputOutput::CLI.new)
    @games = 100.times.map { Game.new(Players::Computer.new("X"), Players::Computer.new("O"))}
    self.input_output = io
  end

  def play_wargames
    @games.each(&:play)
  end
end
