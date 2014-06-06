# coding: UTF-8

module Tematica
  class TematicasController < InheritedResources::Base
    before_filter :gestor_usr_required
  end
end
