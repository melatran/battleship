class Game

  def initialize
    @computer_board = Board.new
    @computer_cruiser = Ship.new("Cruiser", 3)
    @computer_submarine = Ship.new("Submarine", 2)
    @human_board = Board.new
    @human_cruiser = Ship.new("Cruiser", 3)
    @human_submarine = Ship.new("Submarine", 2)
  end

  def main_menu
    p "Welcome to BATTLESHIP!"
    p "Enter p to play. Enter q to quit."
    user_input = gets.chomp.downcase
    if user_input == 'p'
      setup
    else
      p "Invalid Input"
      exit
    end
  end

  def set_the_game
    coordinates = @computer_board.cells.keys.sample(@computer_cruiser.length)
    if @computer_board.valid_placement?(@computer_cruiser, coordinates) == true
      p coordinates
    else
      set_the_game
      end
  end
end
