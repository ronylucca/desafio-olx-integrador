package desafio.olx.integrador.jobs

/**
 * Created by rony on 15/06/16.
 */
class ConsultaFonteIntegradoraJob {

    def consultaFonteIntegradoraService

    static triggers = {
        simple name: 'consultaFonteIntegradoraTrigger', startDelay: 1000, repeatInterval:  420000
    }

    def group = "update-resource"
    def description = "Job responsavel por obter conteudo da fonte integradora de anuncios imoveis"

    def execute(){
        consultaFonteIntegradoraService.obtemFonteIntegradoraImoveis()
    }
}
