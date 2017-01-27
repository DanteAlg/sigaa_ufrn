module SigaaUfrn
  class Library < SigaaBase
    SERVICE_NAME = 'biblioteca'
    ARTICLES_QUERY = { autor: nil, titulo: nil, palavras_chave: nil }
    ARTICLE_DETAIL_QUERY = { autor: nil, titulo: nil, palavras_chave: nil, id_artigo: nil }
    BOOKS_QUERY = { titulo: nil, assunto: nil, autor: nil, dados_titulo: nil }

    def materials
      run(:get, 'consulta/biblioteca/materiais')
    end

    def libraries
      run(:get, 'consulta/biblioteca')
    end

    # Accepts: autor, titulo, palavras_chave
    def articles(query = {})
      run(:get, "consulta/biblioteca/artigos/#{query_to_url(query)}")
    end

    # Accepts: autor, titulo, palavras_chave, id_artigo
    def detailed_articles(query = {})
      run(:get, "consulta/biblioteca/artigos/#{query_to_url(query)}/detalhado")
    end

    def books_loan
      run(:get, 'consulta/biblioteca/historico')
    end

    def current_books_loan
      run(:get, 'consulta/biblioteca/historico/emprestimo')
    end

    # Accepts: titulo, assunto, autor, dados_titulo
    def books(query = {})
      run(:get, "consulta/biblioteca/#{query_to_url(query)}")
    end

    def find_by_material_in_library(material_id, library_id)
      run(:get, "consulta/biblioteca/tipomaterial/#{material_id}/#{library_id}")
    end
  end
end
