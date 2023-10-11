select * from public.clientes

-- criei a tabela geracao
ALTER TABLE clientes
ADD COLUMN geracao VARCHAR(50);  
-- atualizei a tabela para adicionar as Geração. 
UPDATE clientes AS c
SET geracao = CASE 
        WHEN c.data_nascimento BETWEEN '1925-01-01' AND '1940-12-31' THEN 'Geração Veterana'
        WHEN c.data_nascimento BETWEEN '1941-01-01' AND '1959-12-31' THEN 'Geração Baby Boomers'
		WHEN c.data_nascimento BETWEEN '1960-01-01' AND '1979-12-31' THEN 'Geração X'
		WHEN c.data_nascimento BETWEEN '1980-01-01' AND '1995-12-31' THEN 'Geração Y'
		WHEN c.data_nascimento BETWEEN '1996-01-01' AND '2010-12-31' THEN 'Geração Z'
        ELSE 'Geração Alpha'
    END;
S
-- select para testar o Case
SELECT 
    c.id,
    c.sexo,
    c.data_nascimento,
    c.data_cadastro,
    c.cidade,
    c.uf,
    CASE 
        WHEN c.data_nascimento BETWEEN '1925-01-01' AND '1940-12-31' THEN 'Geração Veterana'
        WHEN c.data_nascimento BETWEEN '1941-01-01' AND '1959-12-31' THEN 'Geração Baby Boomers'
		WHEN c.data_nascimento BETWEEN '1960-01-01' AND '1979-12-31' THEN 'Geração X'
		WHEN c.data_nascimento BETWEEN '1980-01-01' AND '1995-12-31' THEN 'Geração Y'
		WHEN c.data_nascimento BETWEEN '1996-01-01' AND '2010-12-31' THEN 'Geração Z'
        ELSE 'Geração Alpha'
    END AS geracao
FROM public.clientes c;

-- a) Quanto de rake foi gerado por cada Geração* de jogadores?
SELECT
    c.geracao,
    SUM(r.rake) AS total_rake
FROM clientes c
INNER JOIN resultado r ON c.id = r.clientes_id
GROUP BY c.geracao
ORDER BY c.geracao;

-- b) Qual foi o rake gerado por mês?
select
	-- extraindo ano e mes
    EXTRACT(YEAR FROM r.data_acesso) AS ano, 
    EXTRACT(MONTH FROM r.data_acesso) AS mes,
    SUM(r.rake) AS rake_por_mes
FROM resultado r
GROUP BY ano, mes
ORDER BY ano ASC, mes ASC;


-- c) Qual sexo tem uma maior proporção de ganhadores**?
SELECT
    sexo,
    COUNT(*) AS total_de_jogadores,
    -- Arredonda os Valores para 2 casa decimais.
    ROUND(COUNT(*)::NUMERIC / (SELECT COUNT(*) FROM clientes)::NUMERIC, 2) AS proporcao
FROM resultado
INNER JOIN clientes
    ON resultado.clientes_id = clientes.id
WHERE winning > 0
GROUP BY sexo;

select * from jogos


