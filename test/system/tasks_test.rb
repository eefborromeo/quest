require "application_system_test_case"

class TasksTest < ApplicationSystemTestCase
    test "creating a task" do
        sign_in users(:melissa)
        visit categories_url
        click_on "New Category"

        fill_in "Category", with: "Hello Text"
        click_on "Create Category"

        assert_text "Category was successfully created"

        click_on "Create a new task"
        fill_in "Title", with: "Task 1"
        fill_in "Details", with: "asdfasd"
        click_on "Create Task"

        assert_text "Task was successfully created."
    end

    test "updating a task" do
        sign_in users(:melissa)
        visit categories_url
        click_on "New Category"

        fill_in "Category", with: "Hello Text"
        click_on "Create Category"

        assert_text "Category was successfully created"

        click_on "Create a new task"
        fill_in "Title", with: "Task 1"
        fill_in "Details", with: "asdfasd"
        click_on "Create Task"

        assert_text "Task was successfully created."
        click_on "Task 1"
        click_on "Edit"
        fill_in "Title", with: "Task 2"
        click_on "Update Task"
    end

    test "deleting a task" do
        sign_in users(:melissa)
        visit categories_url
        click_on "New Category"

        fill_in "Category", with: "Hello Text"
        click_on "Create Category"

        assert_text "Category was successfully created"

        click_on "Create a new task"
        fill_in "Title", with: "Task 1"
        fill_in "Details", with: "asdfasd"
        click_on "Create Task"

        assert_text "Task was successfully created."
        click_on "Task 1"
        page.accept_confirm do 
            click_on "Delete", match: :first
        end

        assert_text "Task was successfully destroyed"
    end
end