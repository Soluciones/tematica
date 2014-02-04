# coding: UTF-8

module Tematica
  class Tematizacion < ActiveRecord::Base
    belongs_to :tematizable, polymorphic: true

    validates :tematizable_type, presence: true
    validates :tematizable_id, presence: true
    validates :tematica_id, presence: true, uniqueness: { scope: [:tematizable_type, :tematizable_id, :tematizable_grupo] }

    def nombre_tematica
      Tematica::Tematica.nombre(tematica_id)
    end
  end
end
