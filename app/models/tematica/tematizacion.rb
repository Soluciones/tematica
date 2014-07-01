# coding: UTF-8

module Tematica
  class Tematizacion < ActiveRecord::Base
    attr_accessible :tematizable_type, :tematizable_id, :tematizable_grupo, :tematica_id

    belongs_to :tematizable, polymorphic: true
    belongs_to :tematica

    validates :tematizable_type, presence: true
    validates :tematizable_id, presence: true
    validates :tematica_id, presence: true, uniqueness: { scope: [:tematizable_type, :tematizable_id, :tematizable_grupo] }
    validates :tematica, presence: true

    def nombre_tematica
      Tematica::Tematica.nombre(tematica_id)
    end
  end
end
