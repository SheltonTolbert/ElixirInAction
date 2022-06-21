defmodule Circle do
  @moduledoc "Implements basic circle functions"
  @pi 3.14159

  @doc "Computes the area of a circle"
  @spec area(number) :: number
  def area(r), do: @pi * r * r

  @doc "Computes the circumference of a circle"
  def circumference(r), do: 2 * @pi * r
end
