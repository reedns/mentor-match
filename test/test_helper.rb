ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'minitest/rails'
require 'minitest/rails/capybara'
require 'minitest/pride'
require 'pry'
require 'simplecov'
SimpleCov.start

module ActiveSupport
  class TestCase
    # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical
    # order.
    #
    # Note: You'll currently still have to declare fixtures explicitly in
    # integration tests
    # -- they do not yet inherit this setting
    fixtures :all

    # Add more helper methods to be used by all tests here...
  end
end

def seed_db
  User.create(email: 'mentor@mentor.com',
              password: 'asdfasdf',
              password_confirmation: 'asdfasdf',
              role: 'mentor')
end

def sign_in_mentor(role = :mentor_user)
  visit new_user_session_path
  fill_in 'Email', with: users(role).email
  fill_in 'Password', with: 'password'
  click_button "Go get 'em"
end

def sign_in_mentee(role = :mentee_user)
  visit new_user_session_path
  fill_in 'Email', with: users(role).email
  fill_in 'Password', with: 'password'
  click_button "Go get 'em"
end

def sign_in_admin(role = :admin_user)
  visit new_user_session_path
  fill_in 'Email', with: users(role).email
  fill_in 'Password', with: 'password'
  click_button "Go get 'em"
end

def create_mentorship
  sign_in_mentee
  visit user_path(users(:mentor_user))
  click_on 'Request Mentor'
  click_on 'Sign Out'
  sign_in_mentor
  first(:link, 'Accept').click
  click_on 'Sign Out'
end
