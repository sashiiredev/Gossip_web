module GossipsHelper
  def is_author? (author)
    return current_user == author ? true : false
  end
end
