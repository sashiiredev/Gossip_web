class GossipsController < ApplicationController
  before_action :authenticate_user, only: [:new, :create, :edit, :update, :destroy]

  def index
    @gossips = Gossip.all
  end

  def show
    @gossip = Gossip.find(params[:id])
  end

  def new
    @tags = Tag.all
  end

  def create
    @create_gossip = Gossip.new(title: params[:title], content: params[:content], user: current_user)
    if @create_gossip.save
      flash[:success] = "BRAVO, votre potin a bien été uploadé"
      redirect_to gossips_path
    else
      flash[:error] = "ROLLBACK, hey ! les validations ne sont pas passées, je te renvoie une ou plusieurs erreurs"
      render :new
    end
  end

  def edit
    @gossip = Gossip.find(params[:id])
  end

  def update
    @gossip = Gossip.find(params[:id])
    puts params.inspect
    gossip_params = params.require(:gossip).permit(:title, :content)
    if @gossip.update(gossip_params)
      flash[:success] = "BRAVO, votre potin a bien été modifié"
      redirect_to gossip_path(@gossip.id)
    else
      flash[:error] = "ROLLBACK, erreur sur les champs de modifications"
      render :edit
    end
end

  def destroy
    @gossip = Gossip.find(params[:id])
    @gossip.destroy
    redirect_to gossips_path
  end
end
