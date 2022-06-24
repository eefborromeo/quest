require "application_system_test_case"

class TasksTest < ApplicationSystemTestCase
    setup do
        sign_in users(:melissa)
    end
    test "creating a task" do
        visit categories_url
        click_on "New Category"

        fill_in "Category", with: categories(:one).category
        click_on "Create Category"

        assert_text "Category was successfully created"

        click_on "Create a new task"
        fill_in "Title", with: tasks(:one).title
        fill_in "Details", with: tasks(:one).details
        click_on "Create Task"

        assert_text "Task was successfully created."
    end

    test "updating a task" do
        visit categories_url
        click_on "New Category"

        fill_in "Category", with: categories(:one).category
        click_on "Create Category"

        assert_text "Category was successfully created"

        click_on "Create a new task"
        fill_in "Title", with: tasks(:one).title
        fill_in "Details", with: tasks(:one).details
        click_on "Create Task"
        assert_text "Task was successfully created."
        
        click_on tasks(:one).title
        click_on "Edit"
        fill_in "Title", with: tasks(:two).title
        click_on "Update Task"
    end

    test "deleting a task" do
        visit categories_url
        click_on "New Category"

        fill_in "Category", with: categories(:one).category
        click_on "Create Category"

        assert_text "Category was successfully created"

        click_on "Create a new task"
        fill_in "Title", with: tasks(:one).title
        fill_in "Details", with: tasks(:one).title
        click_on "Create Task"
        assert_text "Task was successfully created."

        click_on tasks(:one).title
        page.accept_confirm do 
            click_on "Delete", match: :first
        end

        assert_text "Task was successfully destroyed"
    end
end