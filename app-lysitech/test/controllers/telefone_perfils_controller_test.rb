require "test_helper"

class TelefonePerfilsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @telefone_perfil = telefone_perfils(:one)
  end

  test "should get index" do
    get telefone_perfils_url
    assert_response :success
  end

  test "should get new" do
    get new_telefone_perfil_url
    assert_response :success
  end

  test "should create telefone_perfil" do
    assert_difference("TelefonePerfil.count") do
      post telefone_perfils_url, params: { telefone_perfil: { numero_tel: @telefone_perfil.numero_tel, perfil_id: @telefone_perfil.perfil_id } }
    end

    assert_redirected_to telefone_perfil_url(TelefonePerfil.last)
  end

  test "should show telefone_perfil" do
    get telefone_perfil_url(@telefone_perfil)
    assert_response :success
  end

  test "should get edit" do
    get edit_telefone_perfil_url(@telefone_perfil)
    assert_response :success
  end

  test "should update telefone_perfil" do
    patch telefone_perfil_url(@telefone_perfil), params: { telefone_perfil: { numero_tel: @telefone_perfil.numero_tel, perfil_id: @telefone_perfil.perfil_id } }
    assert_redirected_to telefone_perfil_url(@telefone_perfil)
  end

  test "should destroy telefone_perfil" do
    assert_difference("TelefonePerfil.count", -1) do
      delete telefone_perfil_url(@telefone_perfil)
    end

    assert_redirected_to telefone_perfils_url
  end
end
