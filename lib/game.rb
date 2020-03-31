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
      place_computer_ships
    elsif user_input == 'q'
      p "Coward."
      exit
    else
      p "Invalid Input"
      main_menu
    end
  end

  def place_computer_ships
    computer_cruiser_coordinates
    @computer_board.place(@computer_cruiser, computer_cruiser_coordinates)
    computer_submarine_coordinates
    @computer_board.place(@computer_submarine, computer_submarine_coordinates)
    puts @computer_board.render(true)
    give_player_explanations
  end

  def computer_cruiser_coordinates
    coordinates = @computer_board.cells.keys.sample(@computer_cruiser.length)
    if @computer_board.valid_placement?(@computer_cruiser, coordinates) == true
      coordinates
    else
      computer_cruiser_coordinates
    end
  end

  def computer_submarine_coordinates
    coordinates = @computer_board.cells.keys.sample(@computer_submarine.length)
    if @computer_board.valid_placement?(@computer_submarine, coordinates) == true
      coordinates
    else
      computer_submarine_coordinates
    end
  end

  def give_player_explanations
    p "I have laid out my ships on the grid."
    p "You need to lay out your two ships."
    p "The Crusier is three units long and the Submarine is two units long."
    puts @human_board.render(true)
    place_human_cruiser
  end

  def place_human_cruiser
    p "Enter the squares for the Cruiser (3 spaces):"
    user_input = gets.chomp.upcase
    user_coordinates = user_input.split(" ")
    if @human_board.valid_placement?(@human_cruiser, user_coordinates) == true
      @human_board.place(@human_cruiser, user_coordinates)
    else
     p "Invalid. Try again!"
     place_human_cruiser
    end
    puts @human_board.render(true)
    place_human_submarine
  end

  def place_human_submarine
    p "Enter the squares for the Cruiser (2 spaces):"
    user_input = gets.chomp.upcase
    user_coordinates = user_input.split(" ")
    if @human_board.valid_placement?(@human_submarine, user_coordinates) == true
      @human_board.place(@human_submarine, user_coordinates)
    else
     p "Invalid. Try again!"
     place_human_submarine
    end
    puts @human_board.render(true)
    start_turn
  end

  def display_computer_board
    p "=============COMPUTER BOARD============="
    puts @computer_board.render
  end

  def display_human_board
    p "=============PLAYER BOARD============="
    puts @human_board.render(true)
  end

  def start_turn
    p "Prepare to die..."
    until @human_cruiser.sunk? && @human_submarine.sunk? || @computer_cruiser.sunk? && @computer_submarine.sunk?
     human_fire_shot
     p human_shot_results
     computer_fire_shot
     p computer_shot_results
   end
    # user shot results
    # computer_fire_shot
    # computer shot results

  end

  def human_fire_shot
    p "Enter the coordinate for your shot:"
    @shot_coordinate = gets.chomp.upcase
    if @computer_board.valid_coordinate?(@shot_coordinate)
      @computer_board.cells[@shot_coordinate].fire_upon
    else
      p "Please enter a valid coordinate:"
      human_fire_shot
    end
    display_computer_board
  end

  def human_shot_results
    if @computer_board.cells[@shot_coordinate].render == 'M'
      "Your shot on #{@shot_coordinate} was a miss."
    elsif @computer_board.cells[@shot_coordinate].render == 'H'
      "Your shot on #{@shot_coordinate} was a hit."
    elsif @computer_board.cells[@shot_coordinate].render == 'X'
        "Your shot on #{@shot_coordinate} sunk my ship."
    end
  end

  def computer_shot_results
    if @human_board.cells[@computer_shot].render == 'M'
      "My shot on #{@computer_shot} was a miss."
    elsif @human_board.cells[@computer_shot].render == 'H'
      "My shot on #{@computer_shot} was a hit."
    elsif @human_board.cells[@computer_shot].render == 'X'
        "My shot on #{@computer_shot} sunk your ship."
    end
  end

  def computer_fire_shot
    @computer_shot = @human_board.cells.keys.sample
      if @human_board.valid_coordinate?(@computer_shot)
        @human_board.cells[@computer_shot].fire_upon
      else
        computer_fire_shot
      end
      display_human_board
  end
end
