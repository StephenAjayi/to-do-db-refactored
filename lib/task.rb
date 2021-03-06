class Task

  attr_reader(:description)
  define_method(:initialize) do |attributes|
    @description = attributes.fetch(:description)
  end

  define_singleton_method(:all) do
    found_tasks = DB.exec("SELECT * FROM tasks;")
    tasks = []
    found_tasks.each() do |found_task|
      description = found_task.fetch("description")
      id = found_task.fetch("id").to_i()
      tasks.push(Task.new(:description => description, :id => id))
    end
    tasks
  end

  define_method(:save) do
    DB.exec("INSERT INTO tasks (description) VALUES ('#{@description}');")
  end

  define_method(:==) do |another_task|
    self.description.==(another_task.description)
  end
end
