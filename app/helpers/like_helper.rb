module LikeHelper

  def already_like?(gossip)
    like = Like.find_by(gossip_id: gossip.id)
    return like == nil ? false : like.user_id == current_user.id
  end

  def find_like(gossip)
    return Like.find_by(gossip_id: gossip.id)
  end
end
