defmodule Supervisame.Pila do
    use GenServer

    alias Supervisame.Calculadora

    def start_link([]), do: GenServer.start_link(__MODULE__, :ok, name: __MODULE__)

    def push(value), do: GenServer.call(__MODULE__, {:push, value})

    def init(:ok) do
        IO.puts("[Pila] Iniciando GenServer")
        {:ok, []}
    end

    def handle_call({:push, :add}, _from, [a, b | stack]) do
        IO.puts "[Pila] Push ADD"
        result = Calculadora.add(a, b)
        {:reply, result, [result | stack]}
    end

    def handle_call({:push, :sub}, _from, [a, b | stack]) do
        IO.puts "[Pila] Push SUB"
        result = Calculadora.sub(a, b)
        {:reply, result, [result | stack]}
    end

    def handle_call({:push, :mul}, _from, [a, b | stack]) do
        IO.puts "[Pila] Push MUL"
        result = Calculadora.mul(a, b)
        {:reply, result, [result | stack]}
    end

    def handle_call({:push, :div}, _from, [a, b | stack]) do
        IO.puts "[Pila] Push DIV"
        result = Calculadora.div(a, b)
        {:reply, result, [result | stack]}
    end

    def handle_call({:push, value}, _from, stack) when is_number(value) do
        IO.puts "[Pila] Push #{value}"
        {:reply, value, [value | stack]}
    end
end