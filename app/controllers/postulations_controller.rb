class PostulationsController < ApplicationController
  def index
    @postulations = Postulation.all
  end
  
  def create
    @postulation = Postulation.new(post_id: params[:post_id])
    @postulation.user = current_user
    @postulation.save
    redirect_to @postulation.post, notice: "Postulación creada exitosamente."
  end

  def update
    @postulation = Postulation.find(params[:id])
    @postulation.update(postulation_params)
    redirect_to @postulation.post, notice: "Postulación actualizada exitosamente."
  end
end
