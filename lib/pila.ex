defmodule Supervisame.Pila do
    use GenServer

    alias Supervisame.Calculadora

    def start_link, do: GenServer.start_link(__MODULE__, :ok)

    def push(pid, value), do: GenServer.call(pid, {:push, value})

    def init(calc) do
        IO.puts("[Pila] Iniciando GenServer")
        {:ok, {calc, []}}
    end

    def handle_call({:push, :add}, _from, {calc, [a, b | stack]}) do
        IO.puts "[Pila] Push ADD"
        result = Calculadora.add(calc, a, b)
        {:reply, result, {calc, [result | stack]}}
    end

    def handle_call({:push, :sub}, _from, {calc, [a, b | stack]}) do
        IO.puts "[Pila] Push SUB"
        result = Calculadora.sub(calc, a, b)
        {:reply, result, {calc, [result | stack]}}
    end

    def handle_call({:push, :mul}, _from, {calc, [a, b | stack]}) do
        IO.puts "[Pila] Push MUL"
        result = Calculadora.mul(calc, a, b)
        {:reply, result, {calc, [result | stack]}}
    end

    def handle_call({:push, :div}, _from, {calc, [a, b | stack]}) do
        IO.puts "[Pila] Push DIV"
        result = Calculadora.div(calc, a, b)
        {:reply, result, {calc, [result | stack]}}
    end

    def handle_call({:push, value}, _from, {calc, stack}) when is_number(value) do
        IO.puts "[Pila] Push #{value}"
        {:reply, value, {calc, [value | stack]}}
    end
end