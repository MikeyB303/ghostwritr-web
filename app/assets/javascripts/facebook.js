$(document).on('ready', function () {

  window.fbAsyncInit = function() {
  FB.init({
    appId      : 1746239882353014,
    xfbml      : true,
    version    : 'v2.8'
  });
  FB.AppEvents.logPageView();
  };

  (function(d, s, id){
     var js, fjs = d.getElementsByTagName(s)[0];
     if (d.getElementById(id)) {return;}
     js = d.createElement(s); js.id = id;
     js.src = "//connect.facebook.net/en_US/sdk.js";
     fjs.parentNode.insertBefore(js, fjs);
  }(document, 'script', 'facebook-jssdk'));

  document.getElementById('shareBtn').onclick = function() {
  postText = $('#post-text').text()
  FB.ui({
    method: 'share',
    display: 'popup',
    href: window.location.href,
    quote: postText,
  }, function(response){});
}
});