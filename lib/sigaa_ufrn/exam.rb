module SigaaUfrn
  class Exam < SigaaBase
    SERVICE_NAME = 'concursos'

    def open
      run(:get, 'consulta/concurso')
    end
  end
end
