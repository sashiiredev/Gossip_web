class CommentController < ApplicationController
  before_action :authenticate_user
  before_action :is_author?, only: [:edit, :update, :destroy]

  def create
    @create_comment = Comment.new(content: params[:user_comment], gossip: Gossip.find(params[:gossip_id]), user: current_user)
    if @create_comment.save
      flash[:success] = "BRAVO, votre commentaire a bien été uploadé"
      redirect_to gossip_path(@create_comment.gossip.id)
    else
      flash[:error] = "ROLLBACK, hey ! les validations ne sont pas passées, je te renvoie une ou plusieurs erreurs"
      redirect_to gossip_path(@create_comment.gossip.id)
    end
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    comment_params = params.require(:comment).permit(:content)
    if @comment.update(comment_params)
      flash[:success] = "BRAVO, votre commentaire a bien été modifié"
      redirect_to gossip_path(@comment.gossip.id)
    else
      flash[:error] = "ROLLBACK, erreur sur les champs de modifications"
      render :edit
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    flash[:success] = "BRAVO, votre commentaire a bien été modifié"
    redirect_to gossip_path(@comment.gossip.id)
  end
end
