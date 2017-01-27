module SigaaUfrn
  class Exam < SigaaBase
    def open
      run(:get, 'consulta/concurso')
    end
  end
end
