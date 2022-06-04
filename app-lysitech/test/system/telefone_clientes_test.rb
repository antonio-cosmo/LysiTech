require "application_system_test_case"

class TelefoneClientesTest < ApplicationSystemTestCase
  setup do
    @telefone_cliente = telefone_clientes(:one)
  end

  test "visiting the index" do
    visit telefone_clientes_url
    assert_selector "h1", text: "Telefone clientes"
  end

  test "should create telefone cliente" do
    visit telefone_clientes_url
    click_on "New telefone cliente"

    fill_in "Cliente", with: @telefone_cliente.cliente_id
    fill_in "Numero tel", with: @telefone_cliente.numero_tel
    click_on "Create Telefone cliente"

    assert_text "Telefone cliente was successfully created"
    click_on "Back"
  end

  test "should update Telefone cliente" do
    visit telefone_cliente_url(@telefone_cliente)
    click_on "Edit this telefone cliente", match: :first

    fill_in "Cliente", with: @telefone_cliente.cliente_id
    fill_in "Numero tel", with: @telefone_cliente.numero_tel
    click_on "Update Telefone cliente"

    assert_text "Telefone cliente was successfully updated"
    click_on "Back"
  end

  test "should destroy Telefone cliente" do
    visit telefone_cliente_url(@telefone_cliente)
    click_on "Destroy this telefone cliente", match: :first

    assert_text "Telefone cliente was successfully destroyed"
  end
end
