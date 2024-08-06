require 'simplecov'
SimpleCov.start

require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

require_relative 'todolist'

class TodoListTest < Minitest::Test

  def setup
    @todo1 = Todo.new("Buy milk")
    @todo2 = Todo.new("Clean room")
    @todo3 = Todo.new("Go to gym")
    @todos = [@todo1, @todo2, @todo3]

    @list = TodoList.new("Today's Todos")
    @list.add(@todo1)
    @list.add(@todo2)
    @list.add(@todo3)
  end

  # Your tests go here. Remember they must start with "test_"
  def test_to_a
    assert_equal(@todos, @list.to_a)
  end

  def test_size
    assert_equal(@todos.size, @list.size)
  end

  def test_first
    assert_equal(@todos[0], @list.first)
  end

  def test_last
    assert_equal(@todo3, @list.last)
  end

  def test_shift
    first_element = @list.first
    deleted_element = @list.shift
    assert_equal(first_element, deleted_element)
    assert_equal(@todos.slice(1..-1), @list.to_a)
  end

  def test_pop
    first_element = @list.last
    deleted_element = @list.pop
    assert_equal(first_element, deleted_element)
    assert_equal(@todos.slice(0..-2), @list.to_a)
  end

  def test_done?
    assert_equal(false, @list.done?)#(@list.all? {|todo| todo.done?})

    @list.each {|todo| todo.done!}
    assert_equal(true, @list.done?)
  end

  def test_add_raise_error
    assert_raises(TypeError) { @list.add(1) }
    assert_raises(TypeError) { @list.add('hi') }
  end

  def test_shovel_operator
    new_todo = Todo.new('Make dishes')
    @list << new_todo
    assert_equal(@list.last, new_todo)
    assert_equal((@todos.size + 1), @list.to_a.size)
  end

  def test_add 
    new_todo = Todo.new('Walk a dog')
    @todos << new_todo
    @list.add(new_todo)
    assert_equal(@todos, @list.to_a)
  end

  def test_item_at
    out_of_range = (@list.to_a.size..1000).to_a.sample
    in_range = (0..(@list.to_a.size - 1)).to_a.sample
    assert_raises(IndexError) {@list.item_at(out_of_range)}
    assert_equal(@todos[in_range], @list.item_at(in_range))
  end

  def test_mark_done_at
    out_of_range = (@list.to_a.size..1000).to_a.sample
    in_range = (0..(@list.to_a.size - 1)).to_a.sample
    assert_raises(IndexError) {@list.mark_done_at(out_of_range)}
    @todos[in_range].done!
    @list.mark_done_at(in_range)
    assert_equal(@todos, @list.to_a)
  end

  def test_mark_undone_at
    out_of_range = (@list.to_a.size..1000).to_a.sample
    in_range = (0..(@list.to_a.size - 1)).to_a.sample
    assert_raises(IndexError) {@list.mark_undone_at(out_of_range)}
    @todos[in_range].undone!
    @list.mark_undone_at(in_range)
    assert_equal(@todos, @list.to_a)
  end

  def test_done!
    @todos.each {|todo| todo.done!}
    @list.done!
    assert_equal(@todos, @list.to_a)
  end

  def test_remove_at
    out_of_range = (@list.to_a.size..1000).to_a.sample
    in_range = (0..(@list.to_a.size - 1)).to_a.sample
    assert_raises(IndexError) {@list.remove_at(out_of_range)}
    @todos.delete_at(in_range)
    @list.remove_at(in_range)
    assert_equal(@todos, @list.to_a)
  end

  def test_to_s
    output = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [ ] Buy milk
    [ ] Clean room
    [ ] Go to gym
    OUTPUT
  
    assert_equal(output, @list.to_s)
  end

  def test_to_s_updated1
    output = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [X] Buy milk
    [ ] Clean room
    [ ] Go to gym
    OUTPUT

    @list.first.done!

    assert_equal(output, @list.to_s)
  end

  def test_to_s_updated2
    output = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [X] Buy milk
    [X] Clean room
    [X] Go to gym
    OUTPUT

    @list.done!
    assert_equal(output, @list.to_s)
  end

  def test_each
    counter = 0
    exp_list = []
    loop do
      exp_list << @todos[counter]
      counter += 1
      break if counter >= @todos.size
    end

    act_list = []
    @list.each {|todo| act_list << todo}

    assert_equal(exp_list, act_list)
  end

  def test_each2
    act_list = @list.each {|todo| todo}
    assert_same(@list, act_list)
  end

  def test_select
    act_list = @list.select {|todo| todo == @todo1}
    assert_equal(false, @list.object_id == act_list.object_id)
    assert_equal(@todo1, act_list.to_a[0])
  end

  def test_find_by_title
    title1 = @todo1.title
    title2 = @todo2.title
    title3 = @todo3.title

    assert_equal(@todo1, @list.find_by_title(title1))
    assert_equal(@todo2, @list.find_by_title(title2))
    assert_equal(@todo3, @list.find_by_title(title3))
  end

  def test_all_done
    @todo3.done!
    @list.mark_done_at(2)

    assert_equal(@todos.select {|todo| todo.done?}, @list.all_done.to_a)
  end

  def test_all_not_done
    @todo3.done!
    @list.mark_done_at(2)

    assert_equal(@todos.select {|todo| !todo.done?}, @list.all_not_done.to_a)
  end

  def test_mark_done!
    @todo2.done!
    title2 = @todo2.title
    @list.mark_done!(title2)

    assert_equal(@todos, @list.to_a)
  end
end