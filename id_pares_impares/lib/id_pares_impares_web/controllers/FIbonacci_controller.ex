defmodule IdParesImparesWeb.FIbonacciController do
    use IdParesImparesWeb, :controller
    alias IdParesImpares.Fibonacci
    
    def fibo(conn, %{"name" => num}) do
        json conn, Fibonacci.fib(String.to_integer(num))
    end  
end