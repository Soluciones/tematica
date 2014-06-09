# coding: UTF-8

module Tematica
  class TematicasController < InheritedResources::Base
    before_filter :gestor_usr_required
    rescue_from ActiveRecord::DeleteRestrictionError, with: :borrar_tematica_con_tematizaciones

  private

    def borrar_tematica_con_tematizaciones
      render text: 'No se pueden borrar temáticas que tengan tematizaciones asociadas'
    end
  end
end
