defmodule AdventOfCode.Year2015.Day08Test do
  use ExUnit.Case

  alias AdventOfCode.Year2015.Day08

  describe "unit tests for counting characters in lines" do
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

    # TODO
    # test "should count total characters for line with hex escape sequences" do
    #   line = "\x27"
    #   result = Day08.count_total_characters(line)
    #   assert result == 6
    # end

    # test "should count string characters for line with hex escape sequences" do
    #   line = "\x27"
    #   result = Day08.count_string_characters(line)
    #   assert result == 1
    # end
  end

  describe "run" do
    test "returns correct result for empty input" do
      input = ""
      result = Day08.run(input)
      assert result == 2
    end

    # TODO
    # Test given examples below
  end
end

# ### Handle Hex Escape Sequences

# Handle hex escape sequences (\x plus two hex characters e.g. \x12)
# "\x27" is 6 characters of code, but the string itself contains just one - an
# apostrophe ('), escaped using hexadecimal notation.

# ### Test calls to run

# given the four strings above, the total number of characters of
# string code (2 + 5 + 10 + 6 = 23) minus the total number of characters in
# memory for string values (0 + 3 + 7 + 1 = 11) is 23 - 11 = 12.
