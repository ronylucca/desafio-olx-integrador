// Place your Spring DSL code here
import org.apache.activemq.ActiveMQConnectionFactory
import org.springframework.jms.connection.SingleConnectionFactory

beans = {

    jmsConnectionFactory(SingleConnectionFactory) {
        targetConnectionFactory = { ActiveMQConnectionFactory cf ->
            //  brokerURL = 'vm://localhost'
            // brokerURL = 'tcp://localhost:8161?jms.useAsyncSend=true'
        }
    }

}
