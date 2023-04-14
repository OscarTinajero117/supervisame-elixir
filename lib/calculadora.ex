defmodule Supervisame.Calculadora do
    use GenServer

    def start_link, do: GenServer.start_link(__MODULE__, :ok)

    def add(pid, a, b), do: GenServer.call(pid, {:add, a, b})
    def sub(pid, a, b), do: GenServer.call(pid, {:sub, a, b})
    def mul(pid, a, b), do: GenServer.call(pid, {:mul, a, b})
    def div(pid, a, b), do: GenServer.call(pid, {:div, a, b})

    def init(:ok) do
        IO.puts("[Calculadora] Iniciando GenServer")
        {:ok, 0}
    end

    def handle_call({:add, a, b}, _from, state) do
        IO.puts("[Calculadora] Sumando #{a} + #{b}")
        {:reply, a + b, state + 1}
    end

    def handle_call({:sub, a, b}, _from, state) do
        IO.puts("[Calculadora] Restando #{a} - #{b}")
        {:reply, a - b, state + 1}
    end

    def handle_call({:mul, a, b}, _from, state) do
        IO.puts("[Calculadora] Multiplicando #{a} * #{b}")
        {:reply, a * b, state + 1}
    end

    def handle_call({:div, a, b}, _from, state) do
        IO.puts("[Calculadora] Dividiendo #{a} / #{b}")
        {:reply, a / b, state + 1}
    end

    def handle_call({:count}, _from, state) do
        IO.puts("[Calculadora] Contando #{state}")
        {:reply, state, state}
    end

    # def handle_info(_msg, state) do
    #     IO.puts("[Calculadora] Mensaje no soportado")
    #     {:noreply, state}
    # end
    
end