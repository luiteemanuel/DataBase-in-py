-- public.newtable definition

DROP TABLE IF EXISTS clientes;
DROP TABLE IF EXISTS Resultado;

 -- cria tabela jogos
CREATE TABLE public.jogos (
    id SERIAL PRIMARY KEY,
    data_jogo DATE,
    hora_jogo TIME,
    time_casa VARCHAR(255),
    time_fora VARCHAR(255),
    gols_time1 INT,
    gols_time2 INT
);

CREATE TABLE public.clientes (
    id SERIAL PRIMARY KEY,
    sexo CHAR(1) CHECK (sexo IN ('m', 'f')),
    data_nascimento DATE,
    data_cadastro DATE,
    cidade VARCHAR(255),
    uf VARCHAR(2)
);

CREATE TABLE public.Resultado (
    id SERIAL PRIMARY KEY,
    clientes_id INT,
    data_acesso DATE,
    buyin FLOAT4,
    winning FLOAT4,
    rake FLOAT4,
    CONSTRAINT fk_clientes FOREIGN KEY (clientes_id) REFERENCES clientes (id)
);


-- função para encrementar os ID da Tabela Resultado. 
DO $$ 
DECLARE 
   proximo_id INT := 1;
BEGIN
   FOR registro IN 1..1020 LOOP
      UPDATE public.resultado
      SET clientes_id = proximo_id
      WHERE id = registro;
      
      proximo_id := proximo_id + 1; 
   END LOOP;
END $$;
