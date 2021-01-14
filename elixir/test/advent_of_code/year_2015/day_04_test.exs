defmodule AdventOfCode.Year2015.Day04Test do
  use ExUnit.Case
  doctest AdventOfCode.Year2015.Day04

  alias AdventOfCode.Year2015.Day04

  test "generates a list of tuples containing hash strings and indices" do
    [result | _tail] = Day04.run(Day04.brute_force_attempts())
    {hash, index} = result

    assert is_binary(hash)
    assert is_integer(index)
  end

  test "generates correct solution for five zeros" do
    [{_hash, index} | _tail] = Day04.run(1_000_000)
    assert index == 282_749
  end
end
