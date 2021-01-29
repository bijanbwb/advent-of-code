defmodule AdventOfCode.Year2015.Day08Test do
  use ExUnit.Case

  alias AdventOfCode.Year2015.Day08

  describe "line counts" do
    test "should count total characters for empty line" do
      line = ""
      result = Day08.count_total_characters(line)
      assert result == 2
    end

    test "should count string characters for empty line" do
      line = ""
      result = Day08.count_string_characters(line)
      assert result == 0
    end

    test "should count total characters for simple line" do
      line = "abc"
      result = Day08.count_total_characters(line)
      assert result == 5
    end

    test "should count string characters for simple line" do
      line = "abc"
      result = Day08.count_string_characters(line)
      assert result == 3
    end

    test "should count total characters for line with escape sequences" do
      line = "aaa\"aaa\\"
      result = Day08.count_total_characters(line)
      assert result == 12
    end

    test "should count string characters for line with escape sequences" do
      line = "aaa\"aaa\\"
      result = Day08.count_string_characters(line)
      assert result == 8
    end

    test "should count total characters for line with hex escape sequences" do
      line = "\x27"
      result = Day08.count_total_characters(line)
      assert result == 6
    end

    test "should count string characters for line with hex escape sequences" do
      line = "\x27"
      result = Day08.count_string_characters(line)
      assert result == 1
    end
  end

  describe "run" do
    test "returns correct result for empty input" do
      input = ""
      result = Day08.run(input)
      assert result == 2
    end

    # test "returns correct result for simple input" do
    #   input = """
    #   "abc"
    #   """

    #   # 5 - 3 == 2
    #   result = Day08.run(input)
    #   assert result == 2
    # end

    # test "returns correct result for example lines given" do
    #   input = """
    #   "abc"
    #   "aaa\"aaa"
    #   "\x27"
    #   """

    #   # Total Characters: (5 + 10 + 6 = 23)
    #   # String Characters: (3 + 7 + 1 = 11)
    #   # Difference: (21 - 11 = 10)
    #   result = Day08.run(input)
    #   assert result == 10
    # end
  end
end
