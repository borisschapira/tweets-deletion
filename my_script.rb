require 'tweet_deletion'
require 'yaml'
accounts_lilou = YAML.load_file('config_lilou.yml')
accounts_bibou = YAML.load_file('config_bibou.yml')

TweetDeletion.with(accounts_bibou) do

  for_favorites(dry: false) do
    keep_if contains('[Veille]'), tag: ' 🔖 '
    keep_if contains('[Reading]'), tag: ' 🔖 '
    keep_if contains('[Bookmark]'), tag: ' 🔖 '

    keep_if by(:me), tag: ' 🗣 '
    keep_if by('boostmarks'), tag: ' 🔖 '

    keep_if rt_by_more_than(10), tag: ' 💯 '
    keep_if fav_by_more_than(10), tag: ' ❤️ '
    keep_if rt_by_more_than(5), tag: ' 💬 '
    keep_if fav_by_more_than(5), tag: ' 💬 '

    keep_if earlier_than(15.days.ago), tag: ' 📅 '
    keep_if rt_by(:me), tag: ' 💬 '
    else_delete tag: ' 🗑 '
  end

  for_tweets(include_rts: true, dry: false) do
    keep_if contains('[Veille]'), tag: ' 🔖 '
    keep_if contains('[Reading]'), tag: ' 🔖 '
    keep_if contains('[Bookmark]'), tag: ' 🔖 '

    keep_if fav_by(:me), tag: ' ❤ ️'
    keep_if has_kept_reply, tag: ' 💬 '
    keep_if has_kept_quote, tag: ' 💬 '

    if is_rt
      keep_if rt_of(:me), tag: ' 🐻 '
      keep_if rt_of('boostmarks'), tag: ' 🔖 '
    else
      keep_if rt_by_more_than(10), tag: ' 💯 '
      keep_if fav_by_more_than(10), tag: ' ❤️ '
      keep_if rt_by_more_than(5), tag: ' 💬 '
      keep_if fav_by_more_than(5), tag: ' 💬 '
    end

    keep_if earlier_than(15.days.ago), tag: ' 📅 '
    else_delete tag: ' 🗑 '
  end

  # for_archive("/Users/boris/Projects/perso/delete_tweets/tweets") do
  #   keep_if contains('[Veille]'), tag: ' 🔖 '
  #   keep_if contains('[Reading]'), tag: ' 🔖 '
  #   keep_if contains('[Bookmark]'), tag: ' 🔖 '

  #   keep_if fav_by(:me), tag: ' ❤ ️'
  #   keep_if has_kept_reply, tag: ' 💬 '
  #   keep_if has_kept_quote, tag: ' 💬 '

  #   if is_rt
  #     keep_if rt_of(:me), tag: ' 🐻 '
  #     keep_if rt_of('boostmarks'), tag: ' 🔖 '
  #   else
  #     keep_if rt_by_more_than(10), tag: ' 💯 '
  #     keep_if fav_by_more_than(10), tag: ' 💯 '
  #     keep_if rt_by_more_than(5), tag: ' 💬 '
  #     keep_if fav_by_more_than(5), tag: ' 💬 '
  #   end

  #   keep_if earlier_than(15.days.ago), tag: ' 📅 '
  #   else_delete tag: ' 🗑 '
  # end

  # for_archive("/Users/boris/Projects/perso/delete_tweets/tweets") do
  #   keep_if contains('[Veille]'), tag: ' 🔖 '
  #   keep_if contains('[Reading]'), tag: ' 🔖 '
  #   keep_if contains('[Bookmark]'), tag: ' 🔖 '

  #   keep_if by(:me), tag: ' 🗣 '
  #   keep_if by('boostmarks'), tag: ' 🔖 '

  #   keep_if rt_by_more_than(10), tag: ' 💯 '
  #   keep_if fav_by_more_than(10), tag: ' ❤️ '
  #   # keep_if rt_by_more_than(5), tag: ' 💬 '
  #   # keep_if fav_by_more_than(5), tag: ' 💬 '

  #   keep_if earlier_than(15.days.ago), tag: ' 📅 '
  #   keep_if rt_by(:me), tag: ' 💬 '

  #   delete_if older_than(180.days.ago), tag: ' 📅 '
  #   else_delete tag: ' 🗑 '
  # end
end

TweetDeletion.with(accounts_lilou) do

  for_favorites(dry: false) do
    keep_if contains('libelilou'), tag: ' 👸 '
    keep_if contains('#damefannysigne'), tag: ' 👌 '
    keep_if contains('#phptour'), tag: ' 🐘 '
    keep_if rt_by_more_than(10), tag: ' 💯 '
    keep_if fav_by_more_than(10), tag: ' ❤️ '
    keep_if rt_by_more_than(5), tag: ' 💬 '
    keep_if fav_by_more_than(5), tag: ' 💬 '
    keep_if earlier_than(15.days.ago), tag: ' 📅 '
    else_delete tag: ' 🗑 '
  end

  for_tweets(include_rts: true, dry: false) do
    keep_if contains('libelilou'), tag: ' 👸 '
    keep_if contains('#damefannysigne'), tag: ' 👌 '
    keep_if contains('#phptour'), tag: ' 🐘 '
    keep_if rt_by_more_than(10), tag: ' 💯 '
    keep_if fav_by_more_than(10), tag: ' ❤️ '
    keep_if rt_by_more_than(5), tag: ' 💬 '
    keep_if fav_by_more_than(5), tag: ' 💬 '
    keep_if earlier_than(15.days.ago), tag: ' 📅 '
    else_delete tag: ' 🗑 '
  end
 end
