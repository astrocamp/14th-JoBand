# frozen_string_literal: true

module PostsHelper
  def post_avatar(user, options = {})
    size = case options[:size]
           when 'large'
             'w-20 h-20'
           when 'small'
             'w-10 h-10'
           else
             'w-14 h-14'
           end

    classes = "#{size} flex-skrink-0 rounded-full border-2 border-white"

    if user.avatar.attached?
      image_tag user.avatar, class: classes
    else
      image_tag '/default_avatar.png', class: classes
    end
  end
end
