package com.banllproject;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

public class Conexao {

    private static Conexao instance;
    private static Connection connection;

    private Conexao() {}
    
    public void getConexao() {
		try {
			Properties prop = getProperties();
			final String url = prop.getProperty("banco.url");
			final String usuario = prop.getProperty("banco.usuario");
			final String senha = prop.getProperty("banco.senha");
			
			Conexao.connection = DriverManager.getConnection(url, usuario, senha);
		} catch (SQLException | IOException e) {
			throw new RuntimeException(e);
		}
	}

    public Connection getConnection() {
        return connection;
    }

    public static Conexao getInstance() throws SQLException {
        if (instance == null || instance.getConnection().isClosed()) {
            instance = new Conexao();
            instance.getConexao();
        }
        return instance;
    }
	
	private static Properties getProperties() throws IOException {
		Properties prop = new Properties();
		Path caminho = Files.walk(Paths.get(".").normalize().toAbsolutePath())
                            .filter(path -> path.toString().contains("project.properties"))
                            .findFirst()
                            .get();
		prop.load(Files.newInputStream(caminho));
		return prop;		
	}

}
