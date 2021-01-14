defmodule AdventOfCode.Year2015.Day04 do
  @brute_force_attempts 1_000_000

  @spec run() :: [{Enum.element(), Enum.index()}]
  def run() do
    Range.new(1, @brute_force_attempts)
    |> Enum.map(&generate_attempt/1)
    |> Enum.with_index(1)
    |> Enum.filter(fn {hash, _index} -> starts_with_five_zeros?(hash) end)
  end

  @doc """
  Generates an MD5 hash using the input string and an attempt number.

  The `attempt_number` is used to generate a string like `"yzbqklnj1000"`,
  which we use to create the MD5 hash: `"ab49b72532b5308d1e80d8c3c3b574a8"`

  ## Example

      iex> AdventOfCode.Year2015.Day04.generate_attempt(1_000)
      "ab49b72532b5308d1e80d8c3c3b574a8"
  """
  @spec generate_attempt(attempt_number :: pos_integer()) :: String.t()
  def generate_attempt(attempt_number) do
    string = raw_input() <> Integer.to_string(attempt_number)

    :crypto.hash(:md5, string)
    |> Base.encode16(case: :lower)
  end

  @spec starts_with_five_zeros?(string :: String.t()) :: boolean()
  def starts_with_five_zeros?(string) do
    String.starts_with?(string, "00000")
  end

  @spec raw_input() :: String.t()
  def raw_input() do
    "yzbqklnj"
  end
end
