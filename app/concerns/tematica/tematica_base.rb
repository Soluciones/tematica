# coding: UTF-8

module Tematica::TematicaBase
  extend ActiveSupport::Concern

  included do
    has_many :tematizaciones, dependent: :restrict_with_exception
    validates :nombre, presence: true
    validates :seccion_publi, presence: true
    scope :publicado, -> { where(publicado: true) }
    scope :datos_desplegable, -> { publicado.select('id, nombre').order('nombre') }
  end

  def to_param
    "#{id}-#{ nombre.parameterize }"
  end

  module ClassMethods
    def nombre(id)
      Rails.cache.fetch("tematica-nombre-#{id}") do
        Tematica::Tematica.find(id).nombre
      end
    end

    def todas
      Rails.cache.fetch("tematicas") do
        Tematica::Tematica.all
      end
    end
  end
end
