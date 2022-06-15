require "test_helper"

class TaskTest < ActiveSupport::TestCase
  test "valid task" do
    task = Task.new(title: 'Task 1', details: 'asdf', completed: true);
    task.save
    task.valid?
    assert_empty task.errors[:task]
  end

  test "valid task with title only" do
    task = Task.new(title: 'Task 1', details: nil, completed: false);
    task.save
    task.valid?
    assert_empty task.errors[:task]
  end

  test "invalid task if there is no title" do
    task = Task.new(title: nil, details: nil, completed: false)
    task.save
    assert_not task.valid?
  end
end
