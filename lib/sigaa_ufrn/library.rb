module SigaaUfrn
  class Library < SigaaBase
    ARTICLES_QUERY = { autor: nil, titulo: nil, palavras_chave: nil }
    ARTICLE_DETAIL_QUERY = { autor: nil, titulo: nil, palavras_chave: nil, id_artigo: nil }
    BOOKS_QUERY = { titulo: nil, assunto: nil, autor: nil, dados_titulo: nil }

    def materials
      run('consulta/biblioteca/materiais', :get)
    end

    def libraries
      run('consulta/biblioteca', :get)
    end

    # Accepts: autor, titulo, palavras_chave
    def articles
      run("consulta/biblioteca/artigos/#{query_to_url(query)}", :get)
    end

    # Accepts: autor, titulo, palavras_chave, id_artigo
    def detailed_articles(query = {})
      run("consulta/biblioteca/artigos/#{query_to_url(query)}/detalhado", :get)
    end

    def books_loan
      run('consulta/biblioteca/historico', :get)
    end

    def current_books_loan
      run('consulta/biblioteca/historico/emprestimo', :get)
    end

    # Accepts: titulo, assunto, autor, dados_titulo
    def books(query = {})
      run("consulta/biblioteca/#{query_to_url(query)}", :get)
    end

    def find_by_material_in_library(material_id, library_id)
      run("consulta/biblioteca/tipomaterial/#{material_id}/#{library_id}", :get)
    end

    private

    def service_type
      'biblioteca-service'
    end
  end
end
