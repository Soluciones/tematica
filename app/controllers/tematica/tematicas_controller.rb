module Tematica
  class TematicasController < InheritedResources::Base
    before_filter :gestor_usr_required
    rescue_from ActiveRecord::DeleteRestrictionError, with: :borrar_tematica_con_tematizaciones

    def destroy
      cambia_publicado(params[:id], false)
    end

    def recuperar
      cambia_publicado(params[:id], true)
    end

    private

    def collection
      @tematicas ||= end_of_association_chain.order('publicado DESC, nombre')
    end

    def borrar_tematica_con_tematizaciones
      render text: 'No se pueden borrar temáticas que tengan tematizaciones asociadas'
    end

    def cambia_publicado(id, publicado)
      tematica = Tematica.find(id)
      tematica.update_attribute(:publicado, publicado)
      redirect_to tematica
    end

    def permitted_params
      params.permit(tematica: [:nombre, :portada_path, :seccion_publi, :publicado])
    end
  end
end
