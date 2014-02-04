# coding: UTF-8

module Tematica
  class Tematizacion < ActiveRecord::Base
    def nombre_tematica
      Tematica.nombre(tematica_id)
    end
  end
end
