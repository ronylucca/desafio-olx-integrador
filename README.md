# desafio-olx-integrador
Projeto desafio OLX feeds

Tecnologias usadas:
 - Grails 2.4.4
 - Quartz 1.0.1
 - ActiveMQ 5.13.3
 - JMS 1.3
 - REST
 - Tomcat 7.0.55 (embedded)
 - Intellij ou Eclipse com plugin para groovy/grails
 
 
 @ Dependências para execução:
   - JDK 1.7
   - Grails 2.4.4
   - ActiveMQ 5.13.3
        1 - executar o script /bin/activemq start
        2 - criar uma queue com o nome 'jms-queue-anuncios-imoveis'
        3 - liberar proxy de acesso a internet na maquina que executará devido as dependencias do projeto e plugins que são baixados durante o build inicial do projeto.
        
   
  @ Observações
    - Job Quartz que varre a url inicial (http://ahul.github.io/imoveis.xml) e extrai o conteúdo do XML está configurado para executar 1 minuto após o 
    start e com intervalo de 7 minutos;
    - Para o ActiveMQ basta a criação da fila(queue) com o nome citado;
    - O serviço que vocês indicaram httpBin não aceita mais PUT/POST/DELETE. Usei um outro serviço (http://www.posttestserver.com/post.php)
    - Configurações de urls e path encontram-se no arquivo /conf/config.groovy do projeto;
    
  @ Fluxo 
    - o Job ConsultaFonteIntegradoraJob inicia sua trajetória obtendo o conteúdo em XML da integradora de imóveis e solicita para cada Imovel,
    inclusão de mensagem na fila. Mesmo sendo um teste, achei inevitável o uso de Jms pois esse efeito tem grande impacto na arquitetura onde processa-se milhoes/dia.
    - Existe um listener que escuta essa fila e segue com a segunda parte do processo. Para cada mensagem, gera-se um json e realiza-se um POST 
    no serviço de MOCK REST citado acima.
    - O processo continua ciclicamente até ser parado. 
    - Existe a possibilidade de acompanhar todo o fluxo de mensageria atraves do console do ActiveMQ.
    
    
  Qualquer dúvida fiquem a vontade para entrar em contato:
  ronylucca@gmail.com
  21 999929055
  
  
  Rony de Lucca
        
