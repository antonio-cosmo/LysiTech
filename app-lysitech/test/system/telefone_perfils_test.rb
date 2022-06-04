require "application_system_test_case"

class TelefonePerfilsTest < ApplicationSystemTestCase
  setup do
    @telefone_perfil = telefone_perfils(:one)
  end

  test "visiting the index" do
    visit telefone_perfils_url
    assert_selector "h1", text: "Telefone perfils"
  end

  test "should create telefone perfil" do
    visit telefone_perfils_url
    click_on "New telefone perfil"

    fill_in "Numero tel", with: @telefone_perfil.numero_tel
    fill_in "Perfil", with: @telefone_perfil.perfil_id
    click_on "Create Telefone perfil"

    assert_text "Telefone perfil was successfully created"
    click_on "Back"
  end

  test "should update Telefone perfil" do
    visit telefone_perfil_url(@telefone_perfil)
    click_on "Edit this telefone perfil", match: :first

    fill_in "Numero tel", with: @telefone_perfil.numero_tel
    fill_in "Perfil", with: @telefone_perfil.perfil_id
    click_on "Update Telefone perfil"

    assert_text "Telefone perfil was successfully updated"
    click_on "Back"
  end

  test "should destroy Telefone perfil" do
    visit telefone_perfil_url(@telefone_perfil)
    click_on "Destroy this telefone perfil", match: :first

    assert_text "Telefone perfil was successfully destroyed"
  end
end
