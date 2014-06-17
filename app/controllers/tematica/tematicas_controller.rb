# coding: UTF-8

module Tematica
  class TematicasController < InheritedResources::Base
    before_filter :gestor_usr_required
    rescue_from ActiveRecord::DeleteRestrictionError, with: :borrar_tematica_con_tematizaciones

    def destroy
      tematica = Tematica.find(params[:id])
      tematica.update_attribute(:publicado, false)
      redirect_to tematica
    end

    def recuperar
      tematica = Tematica.find(params[:id])
      tematica.update_attribute(:publicado, true)
      redirect_to tematica
    end

  private

    def borrar_tematica_con_tematizaciones
      render text: 'No se pueden borrar temáticas que tengan tematizaciones asociadas'
    end
  end
end
