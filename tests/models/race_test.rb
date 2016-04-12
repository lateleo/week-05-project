require_relative "../test_helper.rb"

class RaceTest < MiniTest::Test

  def test_race_can_be_created_normally
    race = Race.new(name: "Human")
    refute_nil(race)
  end

end
