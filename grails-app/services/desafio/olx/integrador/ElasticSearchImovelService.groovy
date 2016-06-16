package desafio.olx.integrador

import grails.converters.JSON
import grails.plugins.rest.client.RestBuilder
import grails.transaction.Transactional
import org.springframework.beans.factory.annotation.Value
import org.springframework.http.HttpStatus
import org.springframework.http.MediaType

@Transactional
class ElasticSearchImovelService {

    @Value('${services.elasticsearch.post.anuncio.imovel}')
    def urlCriacaoAnuncioImovelElasticSearch

    def rest

    def ElasticSearchImovelService(){
         rest = new RestBuilder(connectTimeout: 5000, readTimeout: 20000)
    }

    def solicitaInclusaoDocumentoImovel(imovel){

        try {
            def respostaHttp

            log.warn("Solicitando inclusao de anuncio ao elasticSearch")
            respostaHttp = rest.post(urlCriacaoAnuncioImovelElasticSearch) {
                accept MediaType.APPLICATION_JSON_VALUE
                contentType MediaType.APPLICATION_JSON_VALUE
                json JSON.parse(imovel)
            }
            if (respostaHttp.getStatus().toInteger() != HttpStatus.OK.value()) {
                log.error("Falha ao solicitar inclusao de anuncio ao elasticSearch: ${respostaHttp.error.toString()}")
            }
            log.warn('Sucesso ao incluir anuncio no elasticSearch. HttpStatus: ' + respostaHttp.getStatus())
        } catch (ConnectException ce) {
            log.error("Falha de conexao na comunicacao com servico do Elastic Search")
        } catch (SocketTimeoutException ste) {
            log.error("Timeout na comunicacao com servico do ElasticSearch")
        } catch (Exception e) {
            log.error('Ocorreu um erro ao solicitar inclusao de documento imovel ' + e.getMessage())
        }
    }

    @Deprecated
    def converterXML(xmlNaoValidado, String caminhoXSDCorrespondente) {
        return new XmlSlurper().parseText(xmlNaoValidado)

    }

}
