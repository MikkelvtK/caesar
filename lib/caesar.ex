defmodule Caesar do
  @alpha_num 26
  @upper_range ?A..?Z
  @lower_range ?a..?z

  def main([input, key | _tail]) do
    IO.puts("Your original message: #{input}")

    output =
      input
      |> String.to_charlist()
      |> encrypt(String.to_integer(key))
      |> List.to_string()

    IO.puts("Your encrypted message: #{output}")
  end

  @doc """
  Uses the `key` to encrypt the `input`.

  ## Examples

      iex> Caesar.encrypt(~c"Hello!", 1)
      ~c"Ifmmp!" 

  """
  @spec encrypt(charlist(), non_neg_integer()) :: charlist()
  def encrypt(input, key), do: _encrypt(input, [], key)

  defp _encrypt(input, target, key)
  defp _encrypt([], target, _key), do: Enum.reverse(target)
  defp _encrypt([h | t], target, key), do: _encrypt(t, [shift_char(h, key) | target], key)

  @doc """
  Takes `char` and uses `shift` value to shift it n amounts, wrapping if
  reaching the end.

  ## Examples
      
      iex> Caesar.shift_char(?a, 1)
      ?b 

  """
  def shift_char(char, shift) when char in @upper_range do
    rem(char - ?A + shift, @alpha_num) + ?A
  end

  @spec shift_char(char(), non_neg_integer()) :: char()
  def shift_char(char, shift) when char in @lower_range do
    rem(char - ?a + shift, @alpha_num) + ?a
  end

  def shift_char(char, _shift), do: char
end
