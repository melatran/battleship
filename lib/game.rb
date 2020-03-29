class Game

  def initialize
    # @computer_data = computer_data
    # @user_data = user_data
  end

  def main_menu
    require "pry";binding.pry
    p "Welcome to BATTLESHIP!"
    p "Enter p to play. Enter q to quit."
    user_input = gets.chomp.downcase
    if user_input == 'p'
      setup
    else
      exit
    end
  end

  def setup
    p "Setup test"
  end

  def exit
  end
end
