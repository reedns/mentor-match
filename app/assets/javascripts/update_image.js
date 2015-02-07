var getLinkedInPic = {
  init: function()  {
    $('#linkedin').on('click', this.onLinkedInLoad);
  },

  onLinkedInLoad: function() {
    IN.Event.on(IN, 'auth', this.onLinkedInAuth);
  },

  onLinkedInAuth: function() {
    var profileImg = IN.API.Profile('me').fields(['pictureURL']);
    this.updateProfileImg(profileImg);
  },

  updateProfilePic: function(img) {
    var user_id = $(this).data('id');

    $.ajax({
      method: 'patch',
      url: 'users/' + user_id,
      data: {'image_url': img, 'id': user_id}
    });
  }
};

$(document).ready(function() {
  getLinkedInPic.init();
});
