defmodule Supervisame do
  use Supervisor

  def start_link(args) do
    IO.puts("[Supervisame] Iniciando Supervisor")
    IO.inspect(args)
    Supervisor.start_link(__MODULE__, :ok, name: __MODULE__)
    # Supervisor.start_link([
    #   {Supervisame.Calculadora, []},
    #   {Supervisame.Pila, []}
    # ], strategy: :one_for_one)
  end

  def init(args) do
    IO.puts("[Supervisame] Llamando a init")
    IO.inspect(args)
    childen = [
      {Supervisame.Calculadora, []},
      {Supervisame.Pila, []}
    ]
    Supervisor.init(childen, strategy: :one_for_one)
  end
end
