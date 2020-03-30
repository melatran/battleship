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
    give_player_explanations
  end

  def computer_cruiser_coordinates
    coordinates = @computer_board.cells.keys.sample(@computer_cruiser.length)
    if @computer_board.valid_placement?(@computer_cruiser, coordinates) == true
    else
      computer_cruiser_coordinates
    end
  end

  def computer_submarine_coordinates
    coordinates = @computer_board.cells.keys.sample(@computer_submarine.length)
    if @computer_board.valid_placement?(@computer_submarine, coordinates) == true
    else
      computer_submarine_coordinates
    end
  end


  def give_player_explanations
    p "I have laid out my ships on the grid."
    p "You need to lay out your two ships."
    p "The Crusier is three units long and the Submarine is two units long."
    p @human_board.render(true)
  end

  def place_human_cruiser_coordinates
    p "Enter the squares for the Cruiser (3 spaces):"
    user_input = gets.chomp.upcase
    user_coordinates = user_input.split(" ")
    if @human_board.valid_placement?(@human_cruiser, user_coordinates) == true
      @human_board.place(@human_cruiser, user_coordinates)
    else
     p "Invalid. Try again!"
     place_human_cruiser_coordinates
    end
    @human_board.render(true)
  end

  def place_human_submarine_coordinates
    p "Enter the squares for the Cruiser (2 spaces):"
    user_input = gets.chomp.upcase
    user_coordinates = user_input.split(" ")
    if @human_board.valid_placement?(@human_submarine, user_coordinates) == true
      @human_board.place(@human_submarine, user_coordinates)
    else
     p "Invalid. Try again!"
     place_human_submarine_coordinates
    end
    @human_board.render(true)
  end
end
