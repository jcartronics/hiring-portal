class Post < ApplicationRecord

    # Validaciones
    validates :titulo, presence: true
    validates :descripcion, presence: true
    validates :estado, presence: true

    # Enums
    enum estado: [:borrador, :publicada, :terminada]

end
