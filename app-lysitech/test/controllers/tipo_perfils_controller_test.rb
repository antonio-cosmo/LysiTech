require "test_helper"

class TipoPerfilsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tipo_perfil = tipo_perfils(:one)
  end

  test "should get index" do
    get tipo_perfils_url
    assert_response :success
  end

  test "should get new" do
    get new_tipo_perfil_url
    assert_response :success
  end

  test "should create tipo_perfil" do
    assert_difference("TipoPerfil.count") do
      post tipo_perfils_url, params: { tipo_perfil: { tipo: @tipo_perfil.tipo } }
    end

    assert_redirected_to tipo_perfil_url(TipoPerfil.last)
  end

  test "should show tipo_perfil" do
    get tipo_perfil_url(@tipo_perfil)
    assert_response :success
  end

  test "should get edit" do
    get edit_tipo_perfil_url(@tipo_perfil)
    assert_response :success
  end

  test "should update tipo_perfil" do
    patch tipo_perfil_url(@tipo_perfil), params: { tipo_perfil: { tipo: @tipo_perfil.tipo } }
    assert_redirected_to tipo_perfil_url(@tipo_perfil)
  end

  test "should destroy tipo_perfil" do
    assert_difference("TipoPerfil.count", -1) do
      delete tipo_perfil_url(@tipo_perfil)
    end

    assert_redirected_to tipo_perfils_url
  end
end
