require 'rails_helper'

describe 'CRUD tematicas' do
  it 'puede crear y modificar temáticas' do
    visit engine_tematica.new_tematica_path
    expect(find('h1')).to have_content 'Nueva temática'

    fill_in 'Nombre', with: 'Temapruebas'
    fill_in 'Seccion publi', with: 'Otros'
    # Si se busca el botón por texto, dependiendo del I18n puede ser "Añadir Tematica" o "Create Tematica",
    # así que prefiero buscar por clase
    page.find('.boton_azul').click
    expect(Tematica::Tematica.find_by(nombre: 'Temapruebas')).to be_present

    click_link 'Editar'
    fill_in 'Nombre', with: 'Temaotro'
    page.find('.boton_azul').click
    expect(Tematica::Tematica.find_by(nombre: 'Temapruebas')).to be_nil
    expect(Tematica::Tematica.find_by(nombre: 'Temaotro')).to be_present
  end
end
