defmodule Hello.Log do
    use Supervisor

    def start_link(limits) do
        Supervisor.start_link(__MODULE__, limits)
    end

    def init(limits) do
        children = Enum.map(limits, fn(limit_num) -> 
            worker(Hello.Logger, [limit_num], [id: limit_num, restart: :permanent])
        end)

        supervise(children, strategy: :one_for_one)        
    end
    
end