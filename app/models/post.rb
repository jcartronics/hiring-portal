class Post < ApplicationRecord

    # Validaciones
    validates :titulo, presence: true
    validates :descripcion, presence: true
    validates :estado, presence: true

    # Enums
    enum estado: [:borrador, :publicada, :terminada]

    scope :publicadas, -> { where(estado: :publicada) }
    scope :borradores, -> { where(estado: :borrador) }
    scope :terminadas, -> { where(estado: :terminada) }

end
