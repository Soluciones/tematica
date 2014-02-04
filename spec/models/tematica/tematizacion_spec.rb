# coding: UTF-8

require 'spec_helper'

module Tematica
  describe Tematizacion do
    it '#nombre_tematica' do
      Tematica.should_receive(:nombre)
      FactoryGirl.build(:tematizacion).nombre_tematica
    end
  end
end
