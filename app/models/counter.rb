class Counter
    def self.calculte_percentage_complete(completed_task, total_task)
        completed_task.to_f / total_task.to_f * 100
    end
end

#we can access this counter from console easily with the help of Counter.calculate_percentage_complete(80,100), this is just an example