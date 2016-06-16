package desafio.olx.integrador

import grails.transaction.Transactional
import groovy.xml.XmlUtil
import org.springframework.beans.factory.annotation.Value

@Transactional
class ConsultaFonteIntegradoraService {


    @Value('${services.fonte.url.imoveis}')
    def urlFonteIntegradoraImoveis

    def mensageriaImovelService

    static ARQUIVO_IMOVEIS = '/tmp/imoveis'

    def obtemFonteIntegradoraImoveis(){

        log.info("Obtendo fonte integradora imoveis de ${urlFonteIntegradoraImoveis}" )
        try{
            def imoveisXml = new XmlSlurper().parse(urlFonteIntegradoraImoveis)
            imoveisXml.Imoveis.Imovel.each(){ imovel ->
                realizaInclusaoJMSBroker(imovel)
            }

        }catch(Exception e){
            log.error("Ocorreu um erro ao solicitar a inclusao de imoveis ao broker. Error: ${e.getMessage()}")
        }
        log.info("Solicitacao de inclusao de imoveis ao broker concluida")
    }

    @Deprecated
    def realizaInclusaoBrokerFileSystem(imovel){
        def arquivo = new File(ARQUIVO_IMOVEIS)
        arquivo <<  XmlUtil.serialize(imovel)
    }

    def realizaInclusaoJMSBroker(imovel){
        mensageriaImovelService.escreverMensagemInclusaoAnuncio(XmlUtil.serialize(imovel))
    }
}
