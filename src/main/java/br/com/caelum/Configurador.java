package br.com.caelum;

import java.util.List;

import org.springframework.context.MessageSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Scope;
import org.springframework.context.support.ReloadableResourceBundleMessageSource;
import org.springframework.core.convert.converter.Converter;
import org.springframework.format.FormatterRegistry;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

import br.com.caelum.dao.CategoriaDao;
import br.com.caelum.dao.LojaDao;
import br.com.caelum.dao.ProdutoDao;
import br.com.caelum.model.Categoria;
import br.com.caelum.model.Loja;
import br.com.caelum.model.Produto;

@Configuration
@EnableWebMvc
@ComponentScan("br.com.caelum")
@EnableTransactionManagement
public class Configurador extends WebMvcConfigurerAdapter {
	
	@Bean
	@Scope("request")
	public List<Produto> produtos(ProdutoDao produtoDao) {
		List<Produto> produtos = produtoDao.getProdutos();
		
		return produtos;
	}
	
	@Bean
	public List<Categoria> categorias(CategoriaDao categoriaDao) { 
		List<Categoria> categorias = categoriaDao.getCategorias();
		
		return categorias;
	}
	
	@Bean
	public List<Loja> lojas(LojaDao lojaDao) { 
		List<Loja> lojas = lojaDao.getLojas();
		
		return lojas;
	}
	
	@Bean
	public MessageSource messageSource() { 
		ReloadableResourceBundleMessageSource messageSource = new ReloadableResourceBundleMessageSource();
		
		messageSource.setBasename("/WEB-INF/messages");
		messageSource.setCacheSeconds(1);
		messageSource.setDefaultEncoding("ISO-8859-1");
		
		return messageSource;
		
	}
	
	@Bean 
	public ViewResolver getViewResolver() {
		InternalResourceViewResolver viewResolver = new InternalResourceViewResolver();

		viewResolver.setPrefix("/WEB-INF/views/");
		viewResolver.setSuffix(".jsp");
		
		viewResolver.setExposeContextBeansAsAttributes(true);

		return viewResolver;
	}

	@Override
	public void addFormatters(FormatterRegistry registry) {
		registry.addConverter(new Converter<String, Categoria>() {

			@Override
			public Categoria convert(String categoriaId) {
				Categoria categoria = new Categoria();
				categoria.setId(Integer.valueOf(categoriaId));
				
				return categoria;
			}
			
		});
	}
	
}
