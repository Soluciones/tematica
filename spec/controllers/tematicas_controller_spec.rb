require 'rails_helper'

describe Tematica::TematicasController, type: :controller do
  describe '#destroy' do
    context 'para una temática publicada' do
      let(:tematica) { FactoryGirl.create(:tematica, nombre: 'chorradas', publicado: true) }

      it 'un destroy debe hacer un borrado lógico' do
        delete :destroy, id: "#{ tematica.id }-chorradas", use_route: :tematicas
        tematica.reload
        expect(tematica).not_to be_publicado
      end
    end
  end
end
