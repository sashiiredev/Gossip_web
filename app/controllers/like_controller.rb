class LikeController < ApplicationController
  def create
    @like = Like.new(user: current_user, gossip: Gossip.find(params[:gossip_id]))
    if @like.save
      redirect_to gossip_path(params[:gossip_id])
    else
      flash[:error] = "please log in"
      redirect_to gossip_path(params[:gossip_id])
    end
  end

  def destroy
    @like = Like.find(params[:id])
    @like.destroy
    redirect_to gossip_path(params[:gossip_id])
  end
end
