defmodule SupervisameTest do
  use ExUnit.Case
  doctest Supervisame

  test "greets the world" do
    assert Supervisame.hello() == :world
  end
end
