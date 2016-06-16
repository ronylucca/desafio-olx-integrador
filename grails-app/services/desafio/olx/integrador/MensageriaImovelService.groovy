package desafio.olx.integrador

import grails.transaction.Transactional

@Transactional
class MensageriaImovelService {

    static exposes = ["jms"]
    def jmsService
    def elasticSearchImovelService


    @grails.plugin.jms.Queue(name = "jms-queue-anuncios-imoveis")
    def ouvirMensagemInclusaoAnuncio(msg){
        try{
            logar('Inicio inclusao imovel')
            elasticSearchImovelService.solicitaInclusaoDocumentoImovel(msg)
            logar('Fim inclusao imovel')

        }catch(Exception ex){
            log.error('Ocorreu um erro ao interceptar a mensagem da fila: ' + ex.message)
        }
    }


    private void logar(String texto) {
        log.warn( texto + " - " + new Date())
    }

    def escreverMensagemInclusaoAnuncio(texto){
        try{
            log.info('Enviando mensagem ao broker para inclusao de imovel. ')
            jmsService.send(queue:"jms-queue-anuncios-imoveis",texto,null )
            log.info('Mensagem enviada')
        }catch (Exception exc){
            log.error('Ocorreu um erro ao tentar escrever uma mensagem na fila', exc)
        }
    }
}
