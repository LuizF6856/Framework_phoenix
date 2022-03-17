defmodule IdParesImparesWeb.FIbonacciController do
    use IdParesImparesWeb, :controller
    alias IdParesImpares.Fibonacci
    
    def fibo(conn, %{"sequence" => num}) do
        json conn, Fibonacci.fib(String.to_integer(num))
    end  
end
