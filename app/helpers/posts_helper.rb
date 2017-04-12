module PostsHelper
  def published_posts(user, published = true)
    user.posts.where(published?: published)
  end
end
