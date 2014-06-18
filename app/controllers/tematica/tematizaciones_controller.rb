# coding: UTF-8

module Tematica
  class TematizacionesController < ApplicationController
    before_filter :gestor_usr_required

    def tematizar
      nombre_clase = params[:tematizable_class].classify
      datos_tematizable = { tematizable_id: params[:tematizable_id], tematizable_type: nombre_clase }
      @tematizacion = Tematizacion.where(datos_tematizable).first_or_initialize
    end

    def create
      @tematizacion = Tematizacion.new(params[:tematizacion])
      dont_create = @tematizacion.tematica_id.blank?
      return redirect_to(@tematizacion.tematizable_url) if dont_create || @tematizacion.save
      render 'tematizar'
    end

    def update
      @tematizacion = Tematizacion.find(params[:id])
      destino = @tematizacion.tematizable_url
      if params[:tematizacion][:tematica_id].present?
        return redirect_to(destino) if @tematizacion.update_attributes(params[:tematizacion])
        render 'tematizar'
      else
        @tematizacion.destroy
        redirect_to(destino)
      end
    end
  end
end
