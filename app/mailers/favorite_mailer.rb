class FavoriteMailer < ApplicationMailer
  default from: "awh938@gmail.com"

  def new_comment(user, post, comment)

    # #three headers set to enable conversation
    headers["Message-ID"] = "<comments/#{comment.id}@akwbloccit.example>"
    headers["In-Reply-To"] = "<post/#{post.id}@akwbloccit.example>"
    headers["References"] = "<post/#{post.id}@akwbloccit.example>"

    @user = user
    @post = post
    @comment = comment

    # #mail method preps email with info in hash
    mail(to: user.email, subject: "New comment on #{post.title}")
  end

  def new_post(post)

    # #three headers set to enable conversation
    headers["Message-ID"] = "<posts/#{post.id}@akwbloccit.example>"
    headers["In-Reply-To"] = "<post/#{post.id}@akwbloccit.example>"
    headers["References"] = "<post/#{post.id}@akwbloccit.example>"

    @post = post

    mail(to: post.user.email, subject: "You are following, #{post.title}!")
  end
# ends class
end
