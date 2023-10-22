class PostulationsController < ApplicationController
  before_action :authenticate_user!
  before_action :validar_datos_usuario!, only: [:create]

  def index
    if current_user.role == "admin"
    @postulations = Postulation.all
    else
      @postulations = current_user.postulations
    end
  end
  
  def create
    @postulation = Postulation.new(post_id: params[:post_id])
    @postulation.user = current_user
    if @postulation.save
      redirect_to @postulation.post, notice: "Postulación creada exitosamente."
    else
      redirect_to @postulation.post, alert: "Ya postulaste a esta vacante anteriormente."
    end
  end

  def update
    @postulation = Postulation.find(params[:id])
    @postulation.update(postulation_params)
    redirect_to @postulation.post, notice: "Postulación actualizada exitosamente."
  end

  private

  def validar_datos_usuario!
    if current_user.nombres.blank? || 
      current_user.apellidos.blank? || 
      current_user.rut.blank? ||
      current_user.edad.blank? ||
      current_user.cargo.blank? ||
      current_user.descripcion.blank? ||
      current_user.pretension.blank?

      redirect_to edit_user_registration_path, alert: "Por favor completa todos tus datos antes de postular."
    end
  end
end
