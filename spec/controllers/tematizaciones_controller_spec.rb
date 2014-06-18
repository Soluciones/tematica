# coding: UTF-8

require 'spec_helper'

describe Tematica::TematizacionesController, type: :controller do
  let(:tematica) { FactoryGirl.create(:tematica, nombre: 'chorradas', publicado: true) }

  describe '#create' do
    context 'when tematica_id is provided' do
      it 'should create a tematizacion correctly ' do
        expect {
          post :create, tematizacion: { tematizable_id: 1, tematizable_type: 'Subtipo', tematica_id: tematica.id }, use_route: :tematicas
        }.to change(Tematica::Tematizacion, :count).by(+1)
      end
    end

    context 'when tematica_id is NOT provided' do
      it 'should not create a tematizacion' do
        expect {
          post :create, tematizacion: { tematizable_id: 1, tematizable_type: 'Subtipo', tematica_id: '' }, use_route: :tematicas
        }.not_to change(Tematica::Tematizacion, :count)
      end
    end
  end

  describe '#update' do
    let!(:tematizacion) { FactoryGirl.create(:tematizacion, tematizable_id: 1, tematizable_type: 'Subtipo', tematica_id: tematica.id) }

    context 'when tematica_id is provided' do
      let(:tematica2) { FactoryGirl.create(:tematica, nombre: 'foobar', publicado: true) }

      it 'should update the tematizacion correctly' do
        expect {
          put :update, id: tematizacion.id, tematizacion: { tematizable_id: 1, tematizable_type: 'Subtipo', tematica_id: tematica2.id }, use_route: :tematicas
        }.not_to change(Tematica::Tematizacion, :count)

        tematizacion.reload
        expect(tematizacion.tematica_id).to be tematica2.id
      end
    end

    context 'when tematica_id is not valid' do
      it 'should not permit to update correctly ' do
        expect {
          put :update, id: tematizacion.id, tematizacion: { tematizable_id: 1, tematizable_type: 'Subtipo', tematica_id: -1 }, use_route: :tematicas
        }.not_to change(Tematica::Tematizacion, :count)

        tematizacion.reload
        expect(tematizacion.tematica_id).to be tematica.id
      end
    end

    context 'when tematica_id is NOT provided' do
      it 'should be deleted' do
        expect {
          put :update, id: tematizacion.id, tematizacion: { tematizable_id: 1, tematizable_type: 'Subtipo', tematica_id: '' }, use_route: :tematicas
        }.to change(Tematica::Tematizacion, :count).by(-1)
      end
    end
  end
end
