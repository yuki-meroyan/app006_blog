$(function(){
  function buildHTML(comment){
    var html = `<li class="comment__user-name">
                  <span>
                    ${comment.user_name}
                  </span>
                  <div class="comment__main">
                    ${comment.comment}
                  </div>
                </li>`
    return html;
  }

  $('#new_comment').on('submit', function(e){
    e.preventDefault();
    var formData = new FormData(this);
    var url = $(this).attr('action');
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      
      var html = buildHTML(data);
      $('.middle-main__comment').append(html)
      $(".footer__content").get(0).scrollIntoView(true)
      // $('.middle-content').animate({ scrollTop: $('.middle-content')[0].scrollHeight});
      $('.middle-main__comment').animate({ scrollTop: $('.middle-main__comment')[0].scrollHeight});
      $('#new_comment')[0].reset();
      $('.form-comment-btn').attr('disabled', false);
    })
    .fail(function(){
      alert('入力した内容が正しくなかったため反映できませんでした');
      $('.form-comment-btn').attr('disabled', false);
    })
  });

  $('.footer__top-scroll').on('click', function(){
    $("body,html").animate({ scrollTop: 0 })
  });
})