# coding: UTF-8

module Tematica
  class Tematizacion < ActiveRecord::Base
    belongs_to :tematizable, polymorphic: true

    def nombre_tematica
      Tematica::Tematica.nombre(tematica_id)
    end
  end
end
