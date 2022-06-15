require "test_helper"

class CategoryTest < ActiveSupport::TestCase
  test "valid category" do
    category = Category.new(category: 'Life')
    category.save
    category.valid?
    assert_empty category.errors[:category]
  end

  test "invalid if category is empty" do
    category = Category.new(category: nil)
    category.save
    assert_not category.valid?
  end

  test "invalid if category already exists" do
    category = categories(:one)
    category_two = categories(:two)
    category.category = category_two.category
    category.save
    assert_not category.valid?
  end
end
