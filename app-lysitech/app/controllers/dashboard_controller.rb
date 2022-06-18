class DashboardController < SessionsController
  before_action :require_logged_user
  before_action :set_user_session

  def index
    @perfil = Perfil.find_by(usuario_id: @usuario_logado.id)

    if @perfil 
      if @usuario_logado.gestor
        chamados = OrdemServico.all
        @ch_abertos = chamado_status(chamados, 'aberto')
        @ch_em_andamentos = chamado_status(chamados, 'andamento')
        @ch_concluidos = chamado_status(chamados, 'concluido')
      else
        chamados = OrdemServico.where(perfil_id: @perfil.id)
        @ch_abertos = chamado_status(chamados, 'aberto')
        @ch_em_andamentos = chamado_status(chamados, 'andamento')
        @ch_concluidos = chamado_status(chamados, 'concluido')
      end
    end

  end

  private 

    def chamado_status(chamados, status)
      if status == 'aberto'
        arr = chamados.select do |chamado|
                chamado.estatus == 1
              end
        return arr
      elsif status == 'andamento'
        arr = chamados.select do |chamado|
                  chamado.estatus == 2
              end

        return arr
      elsif status == 'concluido'
        arr = chamados.select do |chamado|
                chamado.estatus == 3
            end

        return arr
      end
    end
    
    
    # def chamados_abertos(chamados)
    #   arr = chamados.select do |chamado|
    #             chamado.estatus == 1
    #         end

    #   return arr
    # end

    # def chamados_andamentos(chamados)
    #   arr = chamados.select do |chamado|
    #             chamado.estatus == 2
    #         end

    #   return arr
      
    # end

    # def chamados_concluidos(chamados)
    #    arr = chamados.select do |chamado|
    #             chamado.estatus == 3
    #          end

    #     return arr
    # end

end
