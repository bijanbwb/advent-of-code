defmodule AdventOfCode.Year2015.Day04Test do
  use ExUnit.Case
  doctest AdventOfCode.Year2015.Day04

  alias AdventOfCode.Year2015.Day04

  test "generates a list of tuples containing hash strings and indices" do
    [result | _tail] = Day04.run(1_000, 1)
    {hash, index} = result

    assert is_binary(hash)
    assert is_integer(index)
  end

  @doc """
  Note the tests below are marked skipped because they are brute force,
  computationally intensive tests that take several seconds to run.
  """
  @tag :skip
  test "generates correct solution for five zeros" do
    [{_hash, index} | _tail] = Day04.run(1_000_000, 5)
    assert index == 282_749
  end

  @tag :skip
  test "generates correct solution for six zeros" do
    [{_hash, index} | _tail] = Day04.run(10_000_000, 6)
    assert index == 9_962_624
  end
end
