require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship.rb'

class ShipTest < Minitest::Test
  def test_it_exists
    cruiser = Ship.new("Cruiser", 3)

    assert_instance_of Ship, cruiser
  end

  def test_it_has_attributes
    cruiser = Ship.new("Cruiser", 3)

    assert_equal "Cruiser", cruiser.name
    assert_equal 3, cruiser.length
  end

  def test_it_has_starting_health
    cruiser = Ship.new("Cruiser", 3)
    require "pry";binding.pry
    assert_equal 3, cruiser.health
  end
end
