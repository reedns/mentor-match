function onLinkedInLoad() {
  IN.Event.on(IN, "auth", onLinkedInAuth);
}

function onLinkedInAuth() {
  IN.API.Profile('me').fields(['pictureUrl']).result(function(result) {
    updateImage(result.values[0]);
  });
}

function updateImage(img) {
  
  console.log(user_id)
}
