require "application_system_test_case"

class ClientesTest < ApplicationSystemTestCase
  setup do
    @cliente = clientes(:one)
  end

  test "visiting the index" do
    visit clientes_url
    assert_selector "h1", text: "Clientes"
  end

  test "should create cliente" do
    visit clientes_url
    click_on "New cliente"

    fill_in "Bairro", with: @cliente.bairro
    fill_in "Cep", with: @cliente.cep
    fill_in "Cidade", with: @cliente.cidade
    fill_in "Cnpj", with: @cliente.cnpj
    fill_in "Email", with: @cliente.email
    fill_in "Inscr estadual", with: @cliente.inscr_estadual
    fill_in "Nome fantasia", with: @cliente.nome_fantasia
    fill_in "Numero", with: @cliente.numero
    fill_in "Observacao", with: @cliente.observacao
    fill_in "Razao social", with: @cliente.razao_social
    fill_in "Rua", with: @cliente.rua
    fill_in "Uf", with: @cliente.uf
    click_on "Create Cliente"

    assert_text "Cliente was successfully created"
    click_on "Back"
  end

  test "should update Cliente" do
    visit cliente_url(@cliente)
    click_on "Edit this cliente", match: :first

    fill_in "Bairro", with: @cliente.bairro
    fill_in "Cep", with: @cliente.cep
    fill_in "Cidade", with: @cliente.cidade
    fill_in "Cnpj", with: @cliente.cnpj
    fill_in "Email", with: @cliente.email
    fill_in "Inscr estadual", with: @cliente.inscr_estadual
    fill_in "Nome fantasia", with: @cliente.nome_fantasia
    fill_in "Numero", with: @cliente.numero
    fill_in "Observacao", with: @cliente.observacao
    fill_in "Razao social", with: @cliente.razao_social
    fill_in "Rua", with: @cliente.rua
    fill_in "Uf", with: @cliente.uf
    click_on "Update Cliente"

    assert_text "Cliente was successfully updated"
    click_on "Back"
  end

  test "should destroy Cliente" do
    visit cliente_url(@cliente)
    click_on "Destroy this cliente", match: :first

    assert_text "Cliente was successfully destroyed"
  end
end
