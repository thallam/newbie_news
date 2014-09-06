class FavoriteMailer < ActionMailer::Base
  default from: "thllm01@gmail.com"

  def new_comment(user, post, comment)
    #New Headers

    headers["Message-ID"] = "<comments/#{comment.id}@newbienews.com>"
    headers["In-Reply-To"] = "<post/#{post.id}>@newbienews.com"
    headers["References"] = "<post/#{post.id}>@newbienews.com"

    @user = user
    @post = post
    @comment = comment

    mail(to:user.email, subject: "New comment on #{post.title}")
  end
end
