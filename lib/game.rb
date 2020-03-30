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

  def place_computer_ships
    @computer_board.place(@computer_cruiser, computer_cruiser_coordinates)
    @computer_board.place(@computer_submarine, computer_submarine_coordinates)
    @computer_board.render(true)
  end

  def computer_cruiser_coordinates
    coordinates = @computer_board.cells.keys.sample(@computer_cruiser.length)
    if @computer_board.valid_placement?(@computer_cruiser, coordinates) == true
      p coordinates
    else
      computer_cruiser_coordinates
    end
  end

  def computer_submarine_coordinates
    coordinates = @computer_board.cells.keys.sample(@computer_submarine.length)
    if @computer_board.valid_placement?(@computer_submarine, coordinates) == true
      p coordinates
    else
      computer_submarine_coordinates
    end
  end
end
