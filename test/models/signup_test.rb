require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  
  def setup
    @user = User.new(username: "gwen", email: "gwen@example.com")
  end 
  
  test "username and email should be valid" do 
    assert @user.valid?
  end 
  
  test "name should be present" do 
    @user.username = " "
    assert_not @user.valid?
  end 
  
  test "name should be unique" do 
    @user.save 
    user2= User.new(username: "gWen")
    assert_not user2.valid? 
  end 
  
  test "name should not be too long" do 
    @user.username = "a" * 26
    assert_not @user.valid?
  end 
  
  test "name should not be too short" do 
    @user.username = "aa"
    assert_not @user.valid?
  end 
  
  test "email should be present" do 
    @user.email = " "
    assert_not @user.valid?
  end 
  
  test "email should be unique" do 
    @user.save 
    user2= User.new(username: "Joe", email: "gwen@example.com")
    assert_not user2.valid? 
  end 
  
  test "email should not be too long" do 
    @user.email = "a" * 126 + "@example.com"
    assert_not @user.valid?
  end 
  
  test "email should not be too short" do 
    @user.email = "aa"
    assert_not @user.valid?
  end 
  
  test "email form should  be too short" do 
    @user.email = "aa@gern"
    assert_not @user.valid?
  end 
end 