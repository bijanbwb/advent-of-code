defmodule AdventOfCode.Year2015.Day04 do
  @type hash :: String.t()
  @type index :: pos_integer()

  @doc """
  Takes a range of attempts to run (`1..1_000`) and a number of zeros to check
  for (`5`), and then generates a list of tuples containing MD5 hashes and
  their related index in the following format:

  `{"000002c655df7738246e88f6c1c43eb7", 282749}`
  """
  @spec run(range_of_attempts_to_run :: Range.t(), number_of_zeros_to_check :: pos_integer()) :: [
          {hash(), index()}
        ]
  def run(range_of_attempts_to_run, number_of_zeros_to_check) do
    range_of_attempts_to_run
    |> Enum.map(&generate_attempt/1)
    |> Enum.with_index(1)
    |> Enum.filter(&starts_with_n_zeros?(&1, number_of_zeros_to_check))
  end

  @doc """
  Generates an MD5 hash using the input string and an attempt number.

  The `attempt_number` is used to generate a string like `"yzbqklnj1000"`,
  which we use to create the MD5 hash: `"ab49b72532b5308d1e80d8c3c3b574a8"`

  ## Example

      iex> AdventOfCode.Year2015.Day04.generate_attempt(1_000)
      "ab49b72532b5308d1e80d8c3c3b574a8"
  """
  @spec generate_attempt(attempt_number :: pos_integer()) :: hash()
  def generate_attempt(attempt_number) do
    string = raw_input() <> Integer.to_string(attempt_number)

    :md5
    |> :crypto.hash(string)
    |> Base.encode16(case: :lower)
  end

  @spec starts_with_n_zeros?(
          {hash :: hash(), index :: index()},
          number_of_zeros :: pos_integer()
        ) :: boolean()
  def starts_with_n_zeros?(
        {hash, _index},
        number_of_zeros
      ) do
    String.starts_with?(hash, String.duplicate("0", number_of_zeros))
  end

  @spec raw_input() :: String.t()
  def raw_input() do
    "yzbqklnj"
  end
end
