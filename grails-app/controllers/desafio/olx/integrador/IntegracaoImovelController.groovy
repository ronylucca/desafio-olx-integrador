package desafio.olx.integrador

import grails.plugins.rest.client.RestBuilder
import org.springframework.beans.factory.annotation.Value
import org.springframework.http.HttpStatus
import org.springframework.http.MediaType

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class IntegracaoImovelController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def mensageriaImovelService

    @Value('${services.elasticsearch.post.anuncio.imovel}')
    def urlCriacaoAnuncioImovelElasticSearch

    def rest

    def escreverMensagem() {
        mensageriaImovelService.escreverMensagemInclusaoAnuncio("Mensagem escrita pela aplicação. EX12767855")
        log.info("Mensagem enviada")
    }

    def solicitarInclusaoAnuncioElasticSearch() {

        rest = new RestBuilder(connectTimeout: 5000, readTimeout: 20000)

        try {
            def respostaHttp

            println('put')
            log.info("Solicitando inclusao de anuncio ao elasticSearch")
            respostaHttp = rest.post(urlCriacaoAnuncioImovelElasticSearch) {
                accept MediaType.APPLICATION_JSON_VALUE
                contentType MediaType.APPLICATION_JSON_VALUE
                json 'TEXTO IMOVEL'
            }
            if (respostaHttp.getStatus().toInteger() != HttpStatus.OK.value()) {
                log.error("Falha ao solicitar inclusao de anuncio ao elasticSearch: ${respostaHttp.error.toString()}")
            }
            println('HTTP PUT STATUS: ' + respostaHttp.getStatus())
        } catch (ConnectException ce) {
            log.error("Falha de conexao na comunicacao com servico do Elastic Search")
        } catch (SocketTimeoutException ste) {
            log.error("Timeout na comunicacao com servico do ElasticSearch")
        } catch (Exception e) {
            log.error('Ocorreu um erro ao solicitar inclusao de documento imovel ' + e.getMessage())
        }
    }


    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond IntegracaoImovel.list(params), model:[integracaoImovelInstanceCount: IntegracaoImovel.count()]
    }

    def show(IntegracaoImovel integracaoImovelInstance) {
        respond integracaoImovelInstance
    }

    def create() {
        respond new IntegracaoImovel(params)
    }

    @Transactional
    def save(IntegracaoImovel integracaoImovelInstance) {
        if (integracaoImovelInstance == null) {
            notFound()
            return
        }

        if (integracaoImovelInstance.hasErrors()) {
            respond integracaoImovelInstance.errors, view:'create'
            return
        }

        integracaoImovelInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'integracaoImovel.label', default: 'IntegracaoImovel'), integracaoImovelInstance.id])
                redirect integracaoImovelInstance
            }
            '*' { respond integracaoImovelInstance, [status: CREATED] }
        }
    }

    def edit(IntegracaoImovel integracaoImovelInstance) {
        respond integracaoImovelInstance
    }

    @Transactional
    def update(IntegracaoImovel integracaoImovelInstance) {
        if (integracaoImovelInstance == null) {
            notFound()
            return
        }

        if (integracaoImovelInstance.hasErrors()) {
            respond integracaoImovelInstance.errors, view:'edit'
            return
        }

        integracaoImovelInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'IntegracaoImovel.label', default: 'IntegracaoImovel'), integracaoImovelInstance.id])
                redirect integracaoImovelInstance
            }
            '*'{ respond integracaoImovelInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(IntegracaoImovel integracaoImovelInstance) {

        if (integracaoImovelInstance == null) {
            notFound()
            return
        }

        integracaoImovelInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'IntegracaoImovel.label', default: 'IntegracaoImovel'), integracaoImovelInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'integracaoImovel.label', default: 'IntegracaoImovel'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
