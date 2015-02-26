$(document).ready(function() {
  $(window).on('resize load', function() {
    if($(window).width() <= 1100) {
      changeText();
    }
    else{
      keepText();
    }
  });
});

function changeText() {
  $('a.mentees').text('Mentees');
  $('a.mentors').text('Mentors');
  $('a.favorites').text('Favorites');
  $('a.account').text('Account');
}

function keepText() {
  $('a.mentees').text('My Mentees');
  $('a.mentors').text('My Mentors');
  $('a.favorites').text('My Favorites');
  $('a.account').text('My Account');
}
