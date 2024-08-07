# This class represents a todo item and its associated
# data: name and description. There's also a "done"
# flag to show whether this todo item is done.

class Todo
  DONE_MARKER = 'X'
  UNDONE_MARKER = ' '

  attr_accessor :title, :description, :done

  def initialize(title, description='')
    @title = title
    @description = description
    @done = false
  end

  def done!
    self.done = true
  end

  def done?
    done
  end

  def undone!
    self.done = false
  end

  def to_s
    "[#{done? ? DONE_MARKER : UNDONE_MARKER}] #{title}"
  end

  def ==(otherTodo)
    title == otherTodo.title &&
      description == otherTodo.description &&
      done == otherTodo.done
  end
end

# This class represents a collection of Todo objects.
# You can perform typical collection-oriented actions
# on a TodoList object, including iteration and selection.

class TodoList
  attr_accessor :title, :todos

  def initialize(title)
    @title = title
    @todos = []
  end

  def add(todo_item)
    if todo_item.class == Todo
      todos << todo_item
    else
      raise TypeError, 'can only add Todo objects'
    end
  end
  alias_method :<<, :add

  def to_s
    text = "---- #{title} ----\n"
    text << @todos.map(&:to_s).join("\n")
    text
  end
  
  def size
    todos.size
  end

  def first
    todos[0]
  end

  def last
    todos[-1]
  end
  
  def to_a
    todos.clone
  end

  def done?
    todos.all? { |item| item.done == true}
  end

  def item_at(index)
    todos.fetch(index)
  end

  def mark_done_at(index)
    todos.fetch(index).done!
  end

  def mark_undone_at(index)
    todos.fetch(index).undone!
  end

  def done!
    todos.each {|item| item.done!}
  end

  def shift
    todos.delete_at(0)
  end

  def pop
    todos.delete_at(-1)
  end

  def remove_at(index)
    todos.delete(todos.fetch(index))
  end

  def each
    counter = 0
    while counter < todos.size
      yield(todos[counter])
  
      counter += 1
    end
  
    self # should return the original object, which is Todolist object
  end
end

todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")

list = TodoList.new("Today's Todos")
list.add(todo1)
list.add(todo2)
list.add(todo3)

list.each do |todo|
  puts todo                   # calls Todo#to_s
end
