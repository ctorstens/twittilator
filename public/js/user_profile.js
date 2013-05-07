
// load user_tweets page, initially with a loader gif, and then with the results of an AJAX request

$.ajax({
  method: 'post',
  url: '/users_tweets',
  data: {twitter_handle: $('#twitter_handle').val()}
}).done(function (data) {
  $('.spinner').hide();
  console.log(data)
  $('.user_tweets').html(data);
}); 


