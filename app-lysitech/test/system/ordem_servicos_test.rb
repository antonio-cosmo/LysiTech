require "application_system_test_case"

class OrdemServicosTest < ApplicationSystemTestCase
  setup do
    @ordem_servico = ordem_servicos(:one)
  end

  test "visiting the index" do
    visit ordem_servicos_url
    assert_selector "h1", text: "Ordem servicos"
  end

  test "should create ordem servico" do
    visit ordem_servicos_url
    click_on "New ordem servico"

    fill_in "Categoria", with: @ordem_servico.categoria
    fill_in "Cliente", with: @ordem_servico.cliente_id
    fill_in "Descricao", with: @ordem_servico.descricao
    fill_in "Dt abertura", with: @ordem_servico.dt_abertura
    fill_in "Dt encerramento", with: @ordem_servico.dt_encerramento
    fill_in "Estatus", with: @ordem_servico.estatus
    fill_in "Perfil", with: @ordem_servico.perfil_id
    fill_in "Solucao", with: @ordem_servico.solucao
    fill_in "Titulo", with: @ordem_servico.titulo
    click_on "Create Ordem servico"

    assert_text "Ordem servico was successfully created"
    click_on "Back"
  end

  test "should update Ordem servico" do
    visit ordem_servico_url(@ordem_servico)
    click_on "Edit this ordem servico", match: :first

    fill_in "Categoria", with: @ordem_servico.categoria
    fill_in "Cliente", with: @ordem_servico.cliente_id
    fill_in "Descricao", with: @ordem_servico.descricao
    fill_in "Dt abertura", with: @ordem_servico.dt_abertura
    fill_in "Dt encerramento", with: @ordem_servico.dt_encerramento
    fill_in "Estatus", with: @ordem_servico.estatus
    fill_in "Perfil", with: @ordem_servico.perfil_id
    fill_in "Solucao", with: @ordem_servico.solucao
    fill_in "Titulo", with: @ordem_servico.titulo
    click_on "Update Ordem servico"

    assert_text "Ordem servico was successfully updated"
    click_on "Back"
  end

  test "should destroy Ordem servico" do
    visit ordem_servico_url(@ordem_servico)
    click_on "Destroy this ordem servico", match: :first

    assert_text "Ordem servico was successfully destroyed"
  end
end
