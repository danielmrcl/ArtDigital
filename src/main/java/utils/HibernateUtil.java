package utils;

import java.net.URI;
import java.util.Properties;

import org.hibernate.SessionFactory;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.hibernate.cfg.Environment;

import entity.Categoria;
import entity.Imagem;
import entity.Login;
import entity.Produto;
import entity.Usuario;

public class HibernateUtil {
	
    private static SessionFactory sessionFactory;
    
    public static SessionFactory getSessionFactory() {
        if (sessionFactory == null) {
            try {
                var configuration = new Configuration();
                
                var settings = new Properties();
                settings.put(Environment.DRIVER, System.getenv("DATABASE_DRIVER"));
                settings.put(Environment.URL, System.getenv("DATABASE_URL"));
                settings.put(Environment.USER, System.getenv("DATABASE_USER"));
                settings.put(Environment.PASS, System.getenv("DATABASE_PASS"));
                settings.put(Environment.DIALECT, System.getenv("DATABASE_DIALECT"));
                settings.put(Environment.HBM2DDL_AUTO, "update");
                
                configuration.setProperties(settings);
                configuration.addAnnotatedClass(Usuario.class);
                configuration.addAnnotatedClass(Produto.class);
                configuration.addAnnotatedClass(Categoria.class);
                configuration.addAnnotatedClass(Login.class);
                configuration.addAnnotatedClass(Imagem.class);

                var serviceRegistry = new StandardServiceRegistryBuilder()
                    .applySettings(configuration.getProperties()).build();

                sessionFactory = configuration.buildSessionFactory(serviceRegistry);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return sessionFactory;
    }
}
