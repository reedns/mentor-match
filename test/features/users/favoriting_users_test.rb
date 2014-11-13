require 'test_helper'

feature 'Favoriting Users' do
  scenario 'A mentee adds and removes a mentor to and from his favorites' do
    sign_in_mentee

    # Add mentor to favorites
    visit user_path(users(:mentor_user))
    click_on 'Add to favorites'
    page.must_have_content 'Remove from favorites'
    page.wont_have_content 'Add to favorites'

    # See mentor in favorites
    visit favorites_path((users(:mentee_user).id))
    page.must_have_content 'Bill Smith'

    # Remove mentor from favorites
    visit user_path(users(:mentor_user))
    click_on 'Remove from favorites'
    page.must_have_content 'Add to favorites'

    # No longer see mentor in favorites
    visit favorites_path((users(:mentee_user).id))
    page.wont_have_content 'Bill Smith'
  end
end
