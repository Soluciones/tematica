# coding: UTF-8

require 'active_support/concern'

module Tematica::Tematizable
  extend ActiveSupport::Concern

  included do
    has_many :tematizaciones, as: :tematizable , class_name: 'Tematica::Tematizacion'
  end

  def fijar_tematicas!(ids_tematicas, grupo = '')
    tematizaciones.where(tematizable_grupo: grupo).where("tematica_id NOT IN (?)", ids_tematicas).delete_all
    (ids_tematicas || []).each{ |tematica_id| asignar_tematica!(tematica_id, grupo) }
  end

  def asignar_tematica!(tematica_id, grupo = '')
    busca_tematica(tematica_id, grupo) or tematizaciones.create!(tematica_id: tematica_id, tematizable_grupo: grupo)
  end

  def desasignar_tematica!(tematica_id, grupo = '')
    busca_tematica(tematica_id, grupo).try(:destroy)
  end

  def busca_tematica(tematica_id, grupo)
    tematizaciones.where(tematica_id: tematica_id, tematizable_grupo: grupo).first
  end
end
