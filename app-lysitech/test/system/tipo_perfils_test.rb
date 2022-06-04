require "application_system_test_case"

class TipoPerfilsTest < ApplicationSystemTestCase
  setup do
    @tipo_perfil = tipo_perfils(:one)
  end

  test "visiting the index" do
    visit tipo_perfils_url
    assert_selector "h1", text: "Tipo perfils"
  end

  test "should create tipo perfil" do
    visit tipo_perfils_url
    click_on "New tipo perfil"

    fill_in "Tipo", with: @tipo_perfil.tipo
    click_on "Create Tipo perfil"

    assert_text "Tipo perfil was successfully created"
    click_on "Back"
  end

  test "should update Tipo perfil" do
    visit tipo_perfil_url(@tipo_perfil)
    click_on "Edit this tipo perfil", match: :first

    fill_in "Tipo", with: @tipo_perfil.tipo
    click_on "Update Tipo perfil"

    assert_text "Tipo perfil was successfully updated"
    click_on "Back"
  end

  test "should destroy Tipo perfil" do
    visit tipo_perfil_url(@tipo_perfil)
    click_on "Destroy this tipo perfil", match: :first

    assert_text "Tipo perfil was successfully destroyed"
  end
end
