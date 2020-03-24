require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship.rb'

class ShipTest < Minitest::Test
  def test_it_exists
    cruiser = Ship.new("Cruiser", 3)

    assert_instance_of Ship, cruiser
  end

  # def test_it_has_attributes
  #   cruiser = Ship.new("Cruiser", 3)
end
