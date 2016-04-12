require_relative "../test_helper.rb"

class PrestigeClassTest < MiniTest::Test

  def test_prestige_class_can_be_created_normally
    prestige_class = PrestigeClass.new(name: "Kensai")
    refute_nil(prestige_class)
  end

end
