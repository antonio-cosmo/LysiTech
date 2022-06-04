require "test_helper"

class TelefoneClientesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @telefone_cliente = telefone_clientes(:one)
  end

  test "should get index" do
    get telefone_clientes_url
    assert_response :success
  end

  test "should get new" do
    get new_telefone_cliente_url
    assert_response :success
  end

  test "should create telefone_cliente" do
    assert_difference("TelefoneCliente.count") do
      post telefone_clientes_url, params: { telefone_cliente: { cliente_id: @telefone_cliente.cliente_id, numero_tel: @telefone_cliente.numero_tel } }
    end

    assert_redirected_to telefone_cliente_url(TelefoneCliente.last)
  end

  test "should show telefone_cliente" do
    get telefone_cliente_url(@telefone_cliente)
    assert_response :success
  end

  test "should get edit" do
    get edit_telefone_cliente_url(@telefone_cliente)
    assert_response :success
  end

  test "should update telefone_cliente" do
    patch telefone_cliente_url(@telefone_cliente), params: { telefone_cliente: { cliente_id: @telefone_cliente.cliente_id, numero_tel: @telefone_cliente.numero_tel } }
    assert_redirected_to telefone_cliente_url(@telefone_cliente)
  end

  test "should destroy telefone_cliente" do
    assert_difference("TelefoneCliente.count", -1) do
      delete telefone_cliente_url(@telefone_cliente)
    end

    assert_redirected_to telefone_clientes_url
  end
end
