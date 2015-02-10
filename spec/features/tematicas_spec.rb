require 'rails_helper'

describe 'CRUD tematicas' do
  it 'puede crear y modificar temáticas' do
    visit engine_tematica.new_tematica_path

    expect(find('h1')).to have_content 'Nueva temática'

  end
end
