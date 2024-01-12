class ToDoList
  def initialize
    @tasks = {}
    @counter = 1
  end

  def add_task(task)
    task_number = generate_task_number
    @tasks[task_number] = task
    puts "Task added (Number: #{task_number}): #{task}"
  end

  def remove_task(task_number)
    task = @tasks.delete(task_number)
    if task
      puts "Task removed (Number: #{task_number}): #{task}"
      shift_tasks_after_delete
    else
      puts "Task not found for number: #{task_number}"
    end
  end

  def update_task(task_number, new_task)
    if @tasks.key?(task_number)
      @tasks[task_number] = new_task
      puts "Task updated for number #{task_number}: #{new_task}"
    else
      puts "Task not found for number: #{task_number}"
    end
  end

  def display_tasks
    if @tasks.empty?
      puts "[ Your To-Do List is empty. ]"
    else
      puts "[ Your To-Do List: ]"
      @tasks.each { |number, task| puts "=> [ #{number}. #{task} ]" }
    end
  end

  def generate_task_number
    @counter.tap { @counter += 1 }
  end

  def shift_tasks_after_delete
    @tasks = @tasks.transform_keys.with_index(1) { |_, index| index }
  end
end

todo_list = ToDoList.new

loop do
  puts
  todo_list.display_tasks
  puts "\nMain Menu:"
  puts "1. Add Task"
  puts "2. Remove Task"
  puts "3. Update Task"
  puts "4. Display Tasks"
  puts "5. Exit"
  print "Enter your choice: "
  choice = gets.chomp.to_i

  case choice
  when 1
    print "Enter your task: "
    task = gets.chomp.to_s
    todo_list.add_task(task)
  when 2
    print "Enter task number to remove: "
    task_number = gets.chomp.to_i
    todo_list.remove_task(task_number)
  when 3
    print "Enter task number to update: "
    task_number = gets.chomp.to_i
    print "Enter new task: "
    new_task = gets.chomp
    todo_list.update_task(task_number, new_task)
  when 4
    todo_list.display_tasks
  when 5
    puts "Exiting program. Goodbye!"
    break
  else
    puts "Invalid choice. Please try again."
  end
end
