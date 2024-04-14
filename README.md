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
      <li>Para isto, basta baixar o Maven versão bin, conforme seu sistema operacional no link: https://maven.apache.org/download.cgi</li>
      <li>Extrair o conteúdo e configurar o Path adicionando a pasta bin. Mais informações: https://maven.apache.org/install.html</li>
  </ol>
  <li>Criar um banco de dados PostgreSQL e executar o script de dump;</li>
  <li>No arquivo project.properties, alterar as configurações de conexão do banco de dados inserindo suas próprias credenciais e o banco de dados no qual foi executado o arquivo de dump;</li>
  <li>Após configurados Java e Maven, em um terminal na pasta do projeto, mais especificamente em /banII-project/school,  utilizar o seguinte comando: mvn compile exec:java</li>
  <li>Pronto! O projeto já está executando.</li>
</ol>
