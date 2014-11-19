require 'test_helper'

feature 'user policy is enforced' do

  before do
    sign_in_mentor
  end

  scenario 'user can edit their own profile' do
    click_on 'settings'
    first(:link, 'Edit').click
    assert_content 'quick questions to build your profile'
  end

  scenario "user cannot edit other user's profile" do
    page.first(:link, 'View Details').click
    refute_css '#edit'
  end
end
