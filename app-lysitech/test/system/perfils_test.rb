require "application_system_test_case"

class PerfilsTest < ApplicationSystemTestCase
  setup do
    @perfil = perfils(:one)
  end

  test "visiting the index" do
    visit perfils_url
    assert_selector "h1", text: "Perfils"
  end

  test "should create perfil" do
    visit perfils_url
    click_on "New perfil"

    fill_in "Bairro", with: @perfil.bairro
    fill_in "Cargo", with: @perfil.cargo
    fill_in "Cep", with: @perfil.cep
    fill_in "Cidade", with: @perfil.cidade
    fill_in "Cpf", with: @perfil.cpf
    fill_in "Departamento", with: @perfil.departamento
    fill_in "Dt nascimento", with: @perfil.dt_nascimento
    fill_in "Email", with: @perfil.email
    fill_in "Nome", with: @perfil.nome
    fill_in "Numero", with: @perfil.numero
    fill_in "Rua", with: @perfil.rua
    fill_in "Tipo perfil", with: @perfil.tipo_perfil_id
    fill_in "Uf", with: @perfil.uf
    click_on "Create Perfil"

    assert_text "Perfil was successfully created"
    click_on "Back"
  end

  test "should update Perfil" do
    visit perfil_url(@perfil)
    click_on "Edit this perfil", match: :first

    fill_in "Bairro", with: @perfil.bairro
    fill_in "Cargo", with: @perfil.cargo
    fill_in "Cep", with: @perfil.cep
    fill_in "Cidade", with: @perfil.cidade
    fill_in "Cpf", with: @perfil.cpf
    fill_in "Departamento", with: @perfil.departamento
    fill_in "Dt nascimento", with: @perfil.dt_nascimento
    fill_in "Email", with: @perfil.email
    fill_in "Nome", with: @perfil.nome
    fill_in "Numero", with: @perfil.numero
    fill_in "Rua", with: @perfil.rua
    fill_in "Tipo perfil", with: @perfil.tipo_perfil_id
    fill_in "Uf", with: @perfil.uf
    click_on "Update Perfil"

    assert_text "Perfil was successfully updated"
    click_on "Back"
  end

  test "should destroy Perfil" do
    visit perfil_url(@perfil)
    click_on "Destroy this perfil", match: :first

    assert_text "Perfil was successfully destroyed"
  end
end
