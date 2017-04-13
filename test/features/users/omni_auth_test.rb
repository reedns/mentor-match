require 'test_helper'

feature 'User can display LinkedIn profile picture via Omniauth' do
  scenario 'sign into LinkedIn' do
    sign_in_mentee
    visit user_path(users(:mentee_user))
    OmniAuth.config.test_mode = true
    OmniAuth.config.add_mock(:linkedin,
                             uid: '12345',
                             info: { image: 'http://m.c.lnkd.licdn.com/user'}
                            )
    Capybara.current_session.driver.request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:linkedin]
    click_link "Don't see your picture? Use your LinkedIn profile picture!"
    page.must_have_content users(:mentee_user).image_url
  end
end
