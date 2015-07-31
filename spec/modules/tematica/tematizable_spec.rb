require 'rails_helper'
require 'temping'

Temping.create :bebedor do
  include Tematica::Tematizable
end


describe Tematica::Tematizable do
  let(:cerveza) { FactoryGirl.create(:tematica, nombre: 'cerveza') }
  let(:whisky) { FactoryGirl.create(:tematica, nombre: 'whisky') }

  describe '#fijar_tematicas!' do
    context 'con un tematizable' do
      let(:luigi) { Bebedor.create }

      it 'debe permitir añadirle una tematización' do
        luigi.fijar_tematicas!([cerveza.id])
        expect(cerveza.tematizaciones.count).to eq 1
      end

      context 'con alguna tematica asignada' do
        before do
          FactoryGirl.create(:tematizacion, tematica: cerveza, tematizable: luigi)
          FactoryGirl.create(:tematizacion, tematica: whisky, tematizable: luigi)
        end

        it 'debe permitir desuscribir todas' do
          luigi.fijar_tematicas!([])
          expect(cerveza.tematizaciones.count).to eq 0
        end

        it 'debe permitir desuscribir algunas' do
          luigi.fijar_tematicas!([whisky.id])
          expect(cerveza.tematizaciones.count).to eq 0
          expect(whisky.tematizaciones.count).to eq 1
        end

        context 'con tematizaciones con grupo' do
          before do
            FactoryGirl.create(:tematizacion, tematica: cerveza, tematizable: luigi, tematizable_grupo: 'expertos')
          end

          it 'debe desuscribir del grupo pero no de otros grupos' do
            luigi.fijar_tematicas!([whisky.id], 'expertos')
            expect(cerveza.tematizaciones.count).to eq 1
            expect(whisky.tematizaciones.count).to eq 2
            expect(cerveza.tematizaciones.where(tematizable_grupo: 'expertos').count).to eq 0
            expect(whisky.tematizaciones.where(tematizable_grupo: 'expertos').count).to eq 1
          end

          it 'debe permitir desuscribir todas en el grupo' do
            luigi.fijar_tematicas!([], 'expertos')
            expect(cerveza.tematizaciones.count).to eq 1
            expect(whisky.tematizaciones.count).to eq 1
            expect(cerveza.tematizaciones.where(tematizable_grupo: 'expertos').count).to eq 0
            expect(whisky.tematizaciones.where(tematizable_grupo: 'expertos').count).to eq 0
          end
        end
      end
    end
  end
end
