class PostPolicy < ApplicationPolicy
  def initialize(user, post)
    @user = user
    @post = post
  end

  def post_owner?
    user && @post.user == user
  end

  def create?
    user&.profile.present?
  end

  def new?
    create?
  end

  def update?
    post_owner?
  end

  def edit?
    update?
  end

  def destroy?
    post_owner?
  end

end
