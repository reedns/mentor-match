[![Stories in Ready](https://badge.waffle.io/bwstud/Mentor-Match-Reboot.png?label=ready&title=Ready)](https://waffle.io/bwstud/Mentor-Match-Reboot)
# Mentor Match


## Final Project for Codefellows Spring/Summer 2014
by Brian Studwell, Marcos Lindsay and Tony Chung

This is a Ruby on Rails app that hopes to make a simple system for Code Fellows students and to connect with potential mentors.

## Final Project for CodeFellows Ruby on Rails Dev Accelator Fall 2014
by Phil Nguyen and Reed Nelson-Saunders

This a continuation of the hard work done by previous students Brian Studwell, Marco Lindsay and Tony Chung. Much of the backend was in place and the front end was beautifully styled. A lot of the work we did was wiring up the backend with the front end to achieve the intended functionality.  We also did cleaned up a lot of code that wasn't being used. Also we increased test coverage quite a bit.  Acccording to Simplecov test coverage is 96%.

### List of current features:

- Mentees can request a mentorship with a mentor and vice versa.
- Mentorship request recipients can accept or decline a request.
- Upon mentorship request acceptance an email is sent to both mentee and mentor with their contact info.
- Users can fill out a profile to let potential mentors/mentees about their background, tech-skills, etc.
- Users can end a mentorship.
- Users can browse and search for potential mentees or mentors.

### List of issues and desired features:

- A message system for mentees to communicate with mentors.
- Fix some of the styling issues: approve/accept buttons on request notices in the dashboard should be stacked.
- An API for mobile or/and Angular front ends.
- Rename some classes to be consistent with the real world use of the app, e.g. Friendship model might be better named Mentorship.
- Add a favorites feature so users can create a list of potential mentors or mentees that they can look at later to make a final choice.
- Fix error with Faker gem data in a migration on Heroku.
