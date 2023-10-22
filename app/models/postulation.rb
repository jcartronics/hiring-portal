class Postulation < ApplicationRecord
  belongs_to :user
  belongs_to :post

  enum estado: [:pendiente, :aceptada, :rechazada]

  validates :user_id, uniqueness: { scope: :post_id, message: "Ya te postulaste a esta Vacante" }

  def aceptar!
    self.aceptada!
    self.post.terminada!
  end

  def rechazar!
    self.rechazada!
  end

  def pendiente!
    self.pendiente!
  end

  def aceptada?
    self.aceptada?
  end

  def rechazada?
    self.rechazada?
  end

  def pendiente?
    self.pendiente?
  end

  scope :pendientes, -> { where(estado: :pendiente) }
  scope :aceptadas, -> { where(estado: :aceptada) }
  scope :rechazadas, -> { where(estado: :rechazada) }
end
