module PostsHelper
  def published_posts(user, published = true)
    user.posts.where(published?: published)
  end

  def return_true_if_user_has_published_post(user)
  	user.posts.each do |post|
  		return true if post.published? == true
  	end
  	return false
  end
end
