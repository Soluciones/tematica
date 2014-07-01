# coding: UTF-8

require 'spec_helper'

module Tematica
  describe Tematizacion do
    it '#nombre_tematica' do
      expect(Tematica::Tematica).to receive(:nombre)
      FactoryGirl.build(:tematizacion).nombre_tematica
    end
  end
end
