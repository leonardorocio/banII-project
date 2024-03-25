# Projeto BANII - Sistema de Gerenciamento - Escola
# Como executar?
Para executar este projeto existem alguns pré-requisitos:
<ol>
  <li>Java SDK (JDK) instalado com a variável de ambiente JAVA_HOME configurada para o caminho de instalação do JDK;
      <br>Link: https://www.oracle.com/br/java/technologies/downloads/
  </li>
  <li>Maven configurado na variável de ambiente Path do sistema operacional, para que possa ser executado por linha de comando;</li>
  <br>
  <ol>
      <li>Para isto, basta baixar o Maven conforme seu sistema operacional no link: https://maven.apache.org/download.cgi</li>
      <li>Extrair o conteúdo e configurar o Path adicionando a pasta bin. Mais informações: https://maven.apache.org/install.html</li>
  </ol>
  <br>
  <b>ADICIONAR MUDANÇA NO PROJECT.PROPERTIES, PARA CREDENCIAIS DE ACESSO AO BANCO<b>
  <br>
  <li>Após configurados Java e Maven, em um terminal utilizar o seguinte comando: mvn compile exec:java</li>
  <li>Pronto! O projeto já está executando.</li>
</ol>
