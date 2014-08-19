### To change this template, choose Tools | Templates
### and open the template in the editor.
##
##require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')
##
##describe Home do
##  before(:each) do
##    @home = Home.new
##  end
##
##  it "should desc" do
##    # TODO
##  end
##end
##
#
##describe 'blog post page' do
##  it 'lets the user post a comment', :js => true do
##    visit blog_post_path(blog_posts(:first_post).id)
##    fill_in 'Author', :with => 'J. Random Hacker'
##    fill_in 'Comment', :with => 'Awesome post!'
##    click_on 'Submit'  # this be an Ajax button -- requires Selenium
##    page.should have_content('has been submitted')
##    page.should have_content('Awesome post!')
##  end
##end
#
#
#require 'spec_helper'
#
#describe 'home page' do
#  it 'welcomes the user' do
#    visit '/'
#    page.should have_content('Welcome')
#  end
#end
#
#describe "the signup process", :type => :request do
#  before :each do
#    User.make(:email => 'user@example.com', :password => 'caplin')
#  end
#
#  it "signs me in" do
#    within("#session") do
#      fill_in 'Login', :with => 'user@example.com'
#      fill_in 'Password', :with => 'password'
#    end
#    click_link 'Login'
#  end
#end
#
#
#describe "login" do
#  it "should be invalid without a username" do
#    @user = User.new
#    @user.should_not be_valid
#    @user.username = 'admin'
#    @user.valid?
#  end
#end
#
#
#
#
