require 'test_helper'

feature 'As a mentor on the browse page' do
  before do
    sign_in_mentor
    click_on 'Browse Mentees'
  end

  scenario 'I can browse only mentees' do
    page.must_have_content users(:mentee_user).first_name
    page.must_have_content users(:mentee_user).last_name
    page.must_have_content users(:mentee_user_2).first_name
    page.must_have_content users(:mentee_user_2).last_name

    page.wont_have_content users(:mentor_user_2).first_name
  end

  # scenario 'I can paginate through different mentees' do
  #   page.must_have_content users(:mentee_user).first_name
  #   page.must_have_content users(:mentee_user_8).first_name
  #   first(:link, "Next").click

  #   page.must_have_content users(:mentee_user_8).first_name
  #   page.wont_have_content users(:mentee_user).first_name
  #   first(:link, "Previous").click

  #   page.must_have_content users(:mentee_user).first_name
  #   page.wont_have_content users(:mentee_user_8).first_name
  # end
end

feature 'As a mentee' do
  scenario 'I can get to my dashboard and view only mentors' do
    sign_in_mentee
    click_on 'Browse Mentors'

    page.must_have_content users(:mentor_user).first_name
    page.must_have_content users(:mentor_user_2).first_name

    page.wont_have_content users(:mentee_user_2).first_name
  end
end

feature 'As a mentor, I want to search for mentees' do
  before do
    visit root_path
    sign_in_mentor
    click_on 'Browse Mentees'
  end

  scenario 'Mentor should find matching mentees through searching' do
    fill_in 'search', with: 'JavaScript'
    click_on 'Search'

    page.must_have_content users(:mentee_user_3).first_name
    page.wont_have_content users(:mentee_user_2).first_name
  end
end
