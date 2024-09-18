--###############################################################################################
-- AULA 03 - COMANDOS BÁSICOS ################################################################
--###############################################################################################

-- 3.1 - COMANDO SQL SELECT

-- PARA QUE SERVE ##################################################################
-- Serve para selecionar colunas de tabelas


-- SINTAXE #########################################################################
select coluna_1, coluna_2, coluna_3
from schema_1.tabela_1


-- EXEMPLOS ########################################################################

-- (Exemplo 1) Seleção de uma coluna de uma tabela
-- Liste os e-mails dos clientes da tabela sales.customers
select email
from sales.customers


-- (Exemplo 2) Seleção de mais de uma coluna de uma tabela
-- Liste os emails e nomes dos clientes da tabela sales.customers
select email, first_name, last_name
from sales.customers


-- (Exemplo 3) Seleção de todas as colunas de uma tabela
-- Liste todos as informações dos clientes da tabela sales.customers
select *
from sales.customers


-- RESUMO ##########################################################################
-- (1) Comando usado para selecionar colunas de tabelas
-- (2) Quando selecionar mais de uma coluna, elas devem ser separadas por vírgula 
-- sem conter vírgula antes do comando FROM
-- (3) Pode-se utilizar o asterisco (*) para selecionar todas as colunas da tabela


-- 3.2 - COMANDO DISTINCT

-- PARA QUE SERVE ##################################################################
-- Serve para remover linhas duplicadas e mostrar apenas linhas distintas
-- Muito usado na etapa de exploração das bases 


-- SINTAXE #########################################################################
select distinct coluna_1, coluna_2, coluna_3
from schema_1.tabela_1


-- EXEMPLOS ########################################################################

-- (Exemplo 1) Seleção de uma coluna sem DISTINCT
-- Liste as marcas de carro que constam na tabela products
select brand
from sales.products

-- (Exemplo 2) Seleção de uma coluna com DISTINCT
-- Liste as marcas de carro distintas que constam na tabela products
select distinct brand
from sales.products

-- (Exemplo 3) Seleção de mais de uma coluna com DISTINCT
-- Liste as marcas e anos de modelo distintos que constam na tabela products
select distinct brand, model_year
from sales.products

-- RESUMO ##########################################################################
-- (1) Comando usado para remover linhas duplicadas e mostrar apenas linhas distintas
-- (2) Muito utilizado na etapa de exploração dos dados
-- (3) Caso mais de uma coluna seja selecionada, o comando SELECT DISTINCT irá 
-- retornar todas as combinações distintas.

-- 3.3 - CLÁUSULAS WHERE

-- PARA QUE SERVE ##################################################################
-- Serve para filtrar linhas de acordo com uma condição


-- SINTAXE #########################################################################
select coluna_1, coluna_2, coluna_3
from schema_1.tabela_1
where condição_x


-- EXEMPLOS ########################################################################

-- (Exemplo 1) Filtro com condição única
-- Liste os emails dos clientes da nossa base que moram no estado de Santa Catarina
select email, state
from sales.customers
where state='SC'


-- (Exemplo 2) Filtro com mais de uma condição
-- Liste os emails dos clientes da nossa base que moram no estado de Santa Catarina
-- ou Mato Grosso do Sul
select email, state
from sales.customers
where state='SC' or state='MS'


-- (Exemplo 3) Condições com datas
-- Liste os emails dos clientes da nossa base que moram no estado de Santa Catarina 
-- ou Mato Grosso do Sul e que tem mais de 30 anos
select email, state, birth_date
from sales.customers
where (state='SC' or state='MS') and birth_date < '1991-12-28'


select email, state, birth_date
from sales.customers
where (state='SC' or state='MS') and birth_date < '19911228'


-- RESUMO ##########################################################################
-- (1) Comando utilizado para filtrar linhas de acordo com uma condição
-- (2) No PostgreSQL são utilizadas aspas simples para delimitar strings 
-- (3) string = sequência de caracteres = texto
-- (4) Pode-se combinar mais de uma condição utilizando os operadores lógicos
-- (5) No PostgreSQL as datas são escritas no formato 'YYYY-MM-DD' ou 'YYYYMMDD'

-- 3.4 COMANDO ORDER BY

-- PARA QUE SERVE ##################################################################
-- Serve para ordenar a seleção de acordo com uma regra definida pelo usuário


-- SINTAXE #########################################################################
select coluna_1, coluna_2, coluna_3
from schema_1.tabela_1
where condição_x=true
order by coluna_1


-- EXEMPLOS ########################################################################

-- (Exemplo 1) Ordenação de valores numéricos
-- Liste produtos da tabela products na ordem crescente com base no preço
select *
from sales.products
order by price

select *
from sales.products
order by price desc -- Caso queira na ordem decrescente


-- (Exemplo 2) Ordenação de texto
-- Liste os estados distintos da tabela customers na ordem crescente
select distinct state
from sales.customers
order by state


-- RESUMO ##########################################################################
-- (1) Comando utilizado para ordenar a seleção de acordo com uma regra definida
-- (2) Por padrão o comando ordena na ordem crescente. Para mudar para a ordem 
-- decrescente usar o comando DESC
-- (3) No caso de strings a ordenação será seguirá a ordem alfabetica


-- 3.5 COMANDO LIMIT

-- PARA QUE SERVE ##################################################################
-- Serve para limitar o nº de linhas da consulta.
-- Muito utilizado na etapa de exploração dos dados


-- SINTAXE #########################################################################
select coluna_1, coluna_2, coluna_3
from schema_1.tabela_1
where condilção_x=true
order by coluna_1
limit N


-- EXEMPLOS ########################################################################

-- (Exemplo 1) Seleção das N primeiras linhas usando LIMIT
-- Liste as 10 primeiras linhas da tabela funnel
select *
from sales.funnel
limit 10


-- (Exemplo 2) Seleção das N primeiras linhas usando LIMIT e ORDER BY
-- Liste os 10 produtos mais caros da tabela products
select *
from sales.products
order by price desc
limit 10


-- RESUMO ##########################################################################
-- (1) Comando utilizado para limitar o nº de linhas da consulta.
-- (2) Muito utilizado na etapa de exploração dos dados
-- (3) Muito utilizado em conjunto com o comando ORDER BY quando o que importa são
-- os TOP N. Ex: "N pagamentos mais recentes", "N produtos mais caros"



--##################################################################################################################
-- DESAFIO AULA 03 - COMANDOS BÁSICOS ########################################################################
--##################################################################################################################

-- (Exercício 1) Selecione os nomes de cidade distintas que existem no estado de
-- Minas Gerais em ordem alfabética (dados da tabela sales.customers)
select distinct city 
from sales.customers c	
where state = 'MG'
order by city 


-- (Exercício 2) Selecione o visit_id das 10 compras mais recentes efetuadas
-- (dados da tabela sales.funnel)
select visit_id 
from sales.funnel f
where paid_date is not null
order by paid_date desc
limit 10


-- (Exercício 3) Selecione todos os dados dos 10 clientes com maior score nascidos
-- após 01/01/2000 (dados da tabela sales.customers)

select * 
from sales.customers c	
where birth_date >= '2000-01-01'
order by score desc 
limit 10

--###############################################################################################
-- AULA 04 - OPERADORES ######################################################################
--###############################################################################################

-- 4.1 - OPERADORES ARITIMÉTICOS

-- PARA QUE SERVE ##################################################################
-- Servem para executar operações matemáticas
-- Muito utilizados para criar colunas calculadas


-- TIPOS ###########################################################################
-- +
-- -
-- *
-- /
-- ^
-- %
-- || --> não é um operador aritmético


-- EXEMPLOS ########################################################################

-- (Exemplo 1) Criação de coluna calculada
-- Crie uma coluna contendo a idade do cliente da tabela sales.customers
select
	email,
	birth_date,
	(current_date - birth_date) / 365 as idade_do_cliente
from sales.customers

select
	email,
	birth_date,
	(current_date - birth_date) / 365 as "idade do cliente"
from sales.customers


-- (Exemplo 2) Utilização da coluna calculada nas queries
-- Liste os 10 clientes mais novos da tabela customers

select
	email,
	birth_date,
	(current_date - birth_date) / 365 as "idade do cliente"
from sales.customers
order by "idade do cliente"


-- (Exemplo 3) Criação de coluna calculada com strings 
-- Crie a coluna "nome_completo" contendo o nome completo do cliente
select
	first_name || ' ' || last_name as nome_completo
from sales.customers


-- RESUMO ##########################################################################
-- (1) Servem para executar operações matemáticas
-- (2) Muito utilizado para criar colunas calculadas
-- (3) Alias (pseudônimos) são muito utilizados para dar nome as colunas calculadas.
-- (4) Para criar pseudônimos que contém espaços no nome são utilizadas aspas duplas
-- (5) No caso de strings o operador de adição (||) irá concatenar as strings
-- (6) Utilize o Guia de comandos para consultar os operadores utilizados no SQL

-- 4.2 - OPERADORES COMPARAÇÃO

-- PARA QUE SERVE ##################################################################
-- Servem para comparar dois valores retornando TRUE ou FALSE
-- Muito utilizado em conjunto com a função WHERE para filtrar linhas de uma seleção


-- TIPOS ###########################################################################
-- =
-- >
-- <
-- >=
-- <=
-- <>


-- EXEMPLOS ########################################################################

-- (Exemplo 1) Uso de operadores como flag
-- Crie uma coluna que retorne TRUE sempre que um cliente for um profissional clt 
select
    customer_id,
	first_name,
    professional_status,
	(professional_status = 'clt') as cliente_clt
from sales.customers


-- RESUMO ##########################################################################
-- (1) Servem para comparar dois valores retornando TRUE ou FALSE
-- (2) Muito utilizado em conjunto com a função WHERE para filtrar linhas de uma 
-- seleção
-- (3) Utilizados para criar colunas Flag que retornem TRUE ou FALSE
-- (4) Utilize o Guia de comandos para consultar os operadores utilizados no SQL


-- 4.3 OPERADORES LÓGICOS

-- PARA QUE SERVE ##################################################################
-- Usados para unir expressões simples em uma composta

-- TIPOS ###########################################################################
-- AND
-- OR
-- NOT
-- BETWEEN
-- IN
-- LIKE
-- ILIKE
-- IS NULL


-- EXEMPLOS ########################################################################

-- (Exemplo 1) Uso do comando BETWEEN 
-- Selecione veículos que custam entre 100k e 200k na tabela products
select *
from sales.products
where price between 100000 and 200000


-- (Exemplo 2)  Uso do comando NOT
-- Selecione veículos que custam abaixo de 100k ou acima 200k 
select *
from sales.products
where price not between 100000 and 200000


-- (Exemplo 3) Uso do comando IN
-- Selecionar produtos que sejam da marca HONDA, TOYOTA ou RENAULT
select *
from sales.products
where brand NOT in ('HONDA', 'TOYOTA', 'RENAULT')


-- (Exemplo 4) Uso do comando LIKE (matchs imperfeitos)
-- Selecione os primeiros nomes distintos da tabela customers que começam
-- com as iniciais ANA
select distinct first_name
from sales.customers
where first_name like 'ANA%'


-- (Exemplo 5) Uso do comando ILIKE (ignora letras maiúsculas e minúsculas)
-- Selecione os primeiros nomes distintos com iniciais 'ana'
select distinct first_name
from sales.customers
where first_name ilike 'ana%'


-- (Exemplo 6) Uso do comando IS NULL
-- Selecionar apenas as linhas que contém nulo no campo "population" na tabela
-- temp_tables.regions
select *
from temp_tables.regions
where population is null


-- RESUMO ##########################################################################
-- (1) Usados para unir expressões simples em uma composta
-- (2) AND: Verifica se duas comparações são simultaneamente verdadeiras
-- (3) OR: Verifica se uma ou outra comparação é verdadeiras
-- (4) BETWEEN: Verifica quais valores estão dentro do range definido
-- (5) IN: Funciona como multiplos ORs
-- (6) LIKE e ILIKE: Comparam textos e são sempre utilizados em conjunto com o 
-- operador %, que funciona como um coringa, indicando que qualquer texto pode 
-- aparecer no lugar do campo
-- (7) ILIKE ignora se o campo tem letras maiúsculas ou minúsculas na comparação
-- (8) IS NULL: Verifica se o campo é nulo
-- (9) Utilize o Guia de comandos para consultar os operadores utilizados no SQL

--###############################################################################################
-- DESAFIO AULA 04 - OPERADORES ######################################################################
--###############################################################################################

-- (Exercício 1) Calcule quantos salários mínimos ganha cada cliente da tabela 
-- sales.customers. Selecione as colunas de: email, income e a coluna calculada "salários mínimos"
-- Considere o salário mínimo igual à R$1200

select 	email
		,income, income, round(income / 1200) as "Salários Minímos"  
from 	sales.customers c 
group by email, income 
limit 10


-- (Exercício 2) Na query anterior acrescente uma coluna informando TRUE se o cliente
-- ganha acima de 5 salários mínimos e FALSE se ganha 4 salários ou menos.
-- Chame a nova coluna de "acima de 4 salários"

select 	c.email as email
		,c.income as salario
		,round(c.income / 1200) as "Nº Salários Minímos"
		,case when round((c.income) / 1200) > 4 then 'TRUE' else 'FALSE' end as "Acima 4 minimos"
		
from sales.customers c 
group by email, income 
limit 10
--
select
	email,
	income,
	(income) / 1200 as "salários mínimos",
	((income) / 1200) > 4 as "acima de 4 salários"
from sales.customers

-- (Exercício 3) Na query anterior filtre apenas os clientes que ganham entre
-- 4 e 5 salários mínimos. Utilize o comando BETWEEN


select
	email,
	income,
	(income) / 1200 as "salários mínimos",
	((income) / 1200) > 4 as "acima de 4"
from sales.customers
where ((income) / 1200) between 4 and 5 


-- (Exercício 4) Selecine o email, cidade e estado dos clientes que moram no estado de 
-- Minas Gerais e Mato Grosso. 

select
	email
	,city
	,state 
--	,count(state)
from sales.customers
where state in ('MG','MT')
order by state 


select 
	state 
	,count(state)
from sales.customers
where state in ('MG','MT')
group by state 
order by state 


-- (Exercício 5) Selecine o email, cidade e estado dos clientes que não 
-- moram no estado de São Paulo.

select
	email
	,city
	,state 
--	,count(state)
from sales.customers
where state not in ('SP')
order by state 


select
	state 
--	,city
--	,state 
	,count(state)
	,professional_status
from sales.customers
--where state not in ('SP')
group by state, professional_status 
order by state 


-- (Exercício 6) Selecine os nomes das cidade que começam com a letra Z.
-- Dados da tabela temp_table.regions

select city 
from temp_tables.regions r 
where city like '%z'
limit 10


--###############################################################################################
-- AULA 05 - FUNÇÕES AGREGADAS ##################################################################
--###############################################################################################


-- 5.1 - FUNÇÕES DE AGREGAÇÃO

-- PARA QUE SERVE ##################################################################
-- Servem para executar operações aritmética nos registros de uma coluna 


-- TIPOS DE FUNÇÕES AGREGADAS ######################################################
-- COUNT()
-- SUM()
-- MIN()
-- MAX()
-- AVG()


-- EXEMPLOS ########################################################################

-- COUNT() -------------------------------------------------------------------------

-- (Exemplo 1) Contagem de todas as linhas de uma tabela
-- Conte todas as visitas realizadas ao site da empresa fictícia
select count(*)
from sales.funnel


-- (Exemplo 2) Contagem das linhas de uma coluna
-- Conte todos os pagamentos registrados na tabela sales.funnel 
select count(paid_date)
from sales.funnel


-- (Exemplo 3) Contagem distinta de uma coluna
-- Conte todos os produtos distintos visitados em jan/21
select count(distinct product_id)
from sales.funnel
where visit_page_date between '2021-01-01' and '2021-01-31'


-- OUTRAS FUNÇÕES ------------------------------------------------------------------

-- (Exemplo 4) Calcule o preço mínimo, máximo e médio dos productos da tabela products
select min(price), max(price), avg(price)
from sales.products


-- (Exemplo 5) Informe qual é o veículo mais caro da tabela products
select max(price) from sales.products

select *
from sales.products
where price = (select max(price) from sales.products)


-- RESUMO ##########################################################################
-- (1) Servem para executar operações aritmética nos registros de uma coluna 
-- (2) Funções agregadas não computam células vazias (NULL) como zero
-- (3) Na função COUNT() pode-se utilizar o asterisco (*) para contar os registros
-- (4) COUNT(DISTINCT ) irá contar apenas os valores exclusivos


-- 5.2 FUNÇÕES DE AGRUPAMENTO

-- PARA QUE SERVE ##################################################################
-- Serve para agrupar registros semelhantes de uma coluna
-- Normalmente utilizado em conjunto com as Funções de agregação


-- EXEMPLOS ########################################################################

-- (Exemplo 1) Contagem agrupada de uma coluna
-- Calcule o nº de clientes da tabela customers por estado
select state, count(*) as contagem
from sales.customers
group by state
order by contagem desc


-- (Exemplo 2) Contagem agrupada de várias colunas
-- Calcule o nº de clientes por estado e status profissional 
select state, professional_status, count(*) as contagem
from sales.customers
group by 1, 2
order by state, contagem desc


-- (Exemplo 3) Seleção de valores distintos
-- Selecione os estados distintos na tabela customers utilizando o group by
select distinct state
from sales.customers

select state
from sales.customers
group by state


-- RESUMO ##########################################################################
-- (1) Serve para agrupar registros semelhantes de uma coluna, 
-- (2) Normalmente utilizado em conjunto com as Funções de agregação
-- (3) Pode-se referenciar a coluna a ser agrupada pela sua posição ordinal 
-- (ex: GROUP BY 1,2,3 irá agrupar pelas 3 primeiras colunas da tabela) 
-- (4) O GROUP BY sozinho funciona como um DISTINCT, eliminando linhas duplicadas


-- 5.3 - FUNÇÕES DE FILTRAGEM

-- PARA QUE SERVE ##################################################################
-- Serve para filtrar linhas da seleção por uma coluna agrupada


-- EXEMPLOS ########################################################################

-- (Exemplo 1) seleção com filtro no HAVING 
-- Calcule o nº de clientes por estado filtrando apenas estados acima de 100 clientes
select 
    state, 
    count(*)
from sales.customers
group by state
having count(*) > 100


-- RESUMO ##########################################################################
-- (1) Tem a mesma função do WHERE mas pode ser usado para filtrar os resultados 
-- das funções agregadas enquanto o WHERE possui essa limitação
-- (2) A função HAVING também pode filtrar colunas não agregadas

--###############################################################################################
-- DESAFIO AULA 05 - FUNÇÕES AGREGADAS ######################################################################
--###############################################################################################

-- EXERCÍCIOS ########################################################################

-- (Exercício 1) Conte quantos clientes da tabela sales.customers tem menos de 30 anos

select 	(current_date - birth_date) / 365 as idade
		,count(*) as contagem
from sales.customers c 
where (select (current_date - birth_date) / 365 as idade) <= 30
group by idade
order by idade desc

--resolução mais simples e correta, atentar ao que se pede (contagem linhas onde tem menos de 30 anos)
select count(*)
from sales.customers c
where ((current_date - birth_date) / 365) < 30

-- (Exercício 2) Informe a idade do cliente mais velho e mais novo da tabela sales.customers

select 	max(((current_date - birth_date) / 365) ) as idoso
		,min(((current_date - birth_date) / 365) ) as jovem
from sales.customers c 

-- (Exercício 3) Selecione todas as informações do cliente mais rico da tabela sales.customers
-- (possívelmente a resposta contém mais de um cliente)

select 	* 
from 	sales.customers c 
where income = (select max(income) from sales.customers c2 )


-- (Exercício 4) Conte quantos veículos de cada marca tem registrado na tabela sales.products
-- Ordene o resultado pelo nome da marca
select 	brand
		,count(*) contagem
from sales.products p 
group by brand 
order by brand 

-- (Exercício 5) Conte quantos veículos existem registrados na tabela sales.products
-- por marca e ano do modelo. Ordene pela nome da marca e pelo ano do veículo

select 	brand
		,model_year 
		,count(*) contagem
from sales.products p 
group by brand, model_year 
order by brand, model_year 


-- (Exercício 6) Conte quantos veículos de cada marca tem registrado na tabela sales.products
-- e mostre apenas as marcas que contém mais de 10 veículos registrados

select 	brand
		,count(*) contagem
from sales.products p 
group by brand
having count(*) > 10
order by brand

-- fazendo por marca e ano do modelo (minha resolução)
select 	brand
		,model_year 
		,count(*) contagem
from sales.products p 
group by brand, model_year 
having count(*) > 4
order by brand, model_year 

--###############################################################################################
-- AULA 06 - JOINS ##############################################################################
--###############################################################################################

-- 4.1 - TIPOS DE JOIN

-- PARA QUE SERVE ##################################################################
-- Servem para combinar colunas de uma ou mais tabelas


-- SINTAXE #########################################################################
select t1.coluna_1, t1.coluna_1, t2.coluna_1, t2.coluna_2
from schema.tabela_1 as t1
ALGUM join schema.tabela_2 as t2
    on condição_de_join


-- EXEMPLOS ########################################################################

-- (Exemplo 1) Utilize o LEFT JOIN para fazer join entre as tabelas
-- temp_tables.tabela_1 e temp_tables.tabela_2
select * from temp_tables.tabela_1
select * from temp_tables.tabela_2

select t1.cpf, t1.name, t2.state
from temp_tables.tabela_1 as t1 
left join temp_tables.tabela_2 as t2
	on t1.cpf = t2.cpf


-- (Exemplo 2) Utilize o INNER JOIN para fazer join entre as tabelas
-- temp_tables.tabela_1 e temp_tables.tabela_2
select t1.cpf, t1.name, t2.state
from temp_tables.tabela_1 as t1 
inner join temp_tables.tabela_2 as t2
	on t1.cpf = t2.cpf


-- (Exemplo 3) Utilize o RIGHT JOIN para fazer join entre as tabelas
-- temp_tables.tabela_1 e temp_tables.tabela_2
select t2.cpf, t1.name, t2.state
from temp_tables.tabela_1 as t1 
right join temp_tables.tabela_2 as t2
	on t1.cpf = t2.cpf


-- (Exemplo 4) Utilize o FULL JOIN para fazer join entre as tabelas
-- temp_tables.tabela_1 e temp_tables.tabela_2
select t2.cpf, t1.name, t2.state
from temp_tables.tabela_1 as t1 
full join temp_tables.tabela_2 as t2
	on t1.cpf = t2.cpf


-- RESUMO ##########################################################################
-- (1) Servem para combinar colunas de uma ou mais tabelas
-- (2) Pode-se chamar todas as colunas com o asterisco (*), mas não é recomendado
-- (3) É uma boa prática criar aliases para nomear as tabelas utilizadas 
-- (4) O JOIN sozinho funciona como INNER JOIN

-- 4.2 - EXEMPLOS DOS TIPOS DE JOINS
	
	-- EXERCÍCIOS ########################################################################

-- (Exemplo 1) Identifique qual é o status profissional mais frequente nos clientes 
-- que compraram automóveis no site

select 
	cus.professional_status,
	count(fun.paid_date) as pagamentos

from sales.funnel as fun
left join sales.customers as cus
	on fun.customer_id = cus.customer_id
group by cus.professional_status
order by pagamentos desc


-- (Exemplo 2) Identifique qual é o gênero mais frequente nos clientes que compraram
-- automóveis no site. Obs: Utilizar a tabela temp_tables.ibge_genders
select * from temp_tables.ibge_genders limit 10

select 
	ibge.gender,
	count(fun.paid_date)
from sales.funnel as fun
left join sales.customers as cus
	on fun.customer_id = cus.customer_id
left join temp_tables.ibge_genders as ibge
	on lower(cus.first_name) = ibge.first_name
group by ibge.gender


-- (Exemplo 3) Identifique de quais regiões são os clientes que mais visitam o site
-- Obs: Utilizar a tabela temp_tables.regions
select * from sales.customers limit 10
select * from temp_tables.regions limit 10

select
	reg.region,
	count(fun.visit_page_date) as visitas
from sales.funnel as fun
left join sales.customers as cus
	on fun.customer_id = cus.customer_id
left join temp_tables.regions as reg
	on lower(cus.city) = lower(reg.city)
	and lower(cus.state) = lower(reg.state)
group by reg.region
order by visitas desc


--###############################################################################################
-- DESAFIO 04 - JOINS ######################################################################
--###############################################################################################

-- EXERCÍCIOS ########################################################################

-- (Exercício 1) Identifique quais as marcas de veículo mais visitada na tabela sales.funnel
select 	p.brand
		,count(*) as visitas
from 		sales.funnel f 
left join 	sales.products p 
	on f.product_id = p.product_id
group by p.brand 
order by visitas desc

-- (Exercício 2) Identifique quais as lojas de veículo mais visitadas na tabela sales.funnel

select * from sales.stores s limit 10

select 	s.store_name 
		,count(*) as visitas
from 		sales.funnel f 
left join 	sales.stores s 
	on f.store_id = s.store_id 
group by s.store_name 
order by visitas desc

-- (Exercício 3) Identifique quantos clientes moram em cada tamanho de cidade (o porte da cidade
-- consta na coluna "size" da tabela temp_tables.regions)
select * from sales.customers c limit 10
select * from temp_tables.regions r 


select 	r."size" as porte
		,count(*) as n_clientes
from 		sales.customers c 
left join 	temp_tables.regions r 
	on lower(c.city) = lower(r.city)
	and lower(c.state) = lower(r.state) 
group by r."size" 
order by n_clientes desc

--###############################################################################################
-- AULA 07 - UNIONS #############################################################################
--###############################################################################################

-- 7.1 SINTAXE E EXEMPLOS DO COMANDO UNION E UNION ALL

-- SINTAXE #########################################################################
select coluna_1, coluna_2
from schema_1.tabela_1

union / union all

select coluna_3, coluna_4 
from schema_2.tabela_2


-- EXEMPLOS ########################################################################

-- (Exemplo 1) União simples de duas tabelas
-- Una a tabela sales.products com a tabela temp_tables.products_2

select * from sales.products
union all
select * from temp_tables.products_2


--###############################################################################################
-- AULA 08 - SUBQUERYS ##########################################################################
--###############################################################################################

-- 8.1 - TIPOS DE SUBQUERY

-- PARA QUE SERVE ##################################################################
-- Servem para consultar dados de outras consultas.


-- TIPOS ###########################################################################
-- Subquery no WHERE
-- Subquery com WITH
-- Subquery no FROM
-- Subquery no SELECT


-- EXEMPLOS ########################################################################

-- (Exemplo 1) Subquery no WHERE
-- Informe qual é o veículo mais barato da tabela products

select *
from sales.products
where price = (select min(price) from sales.products)


-- (Exemplo 2) Subquery com WITH
-- Calcule a idade média dos clientes por status profissional
with alguma_tabela as (
select
	professional_status,
	(current_date - birth_date)/365 as idade
from sales.customers
)

select
	professional_status,
	avg(idade) as idade_media
from alguma_tabela
group by professional_status


-- (Exemplo 3) Subquery no FROM
-- Calcule a média de idades dos clientes por status profissional
select
	professional_status,
	avg(idade) as idade_media
from (
		select
			professional_status,
			(current_date - birth_date)/365 as idade
		from sales.customers
	 ) as alguma_tabela
group by professional_status


-- (Exemplo 4) Subquery no SELECT
-- Na tabela sales.funnel crie uma coluna que informe o nº de visitas acumuladas 
-- que a loja visitada recebeu até o momento

select
	fun.visit_id,
	fun.visit_page_date,
	sto.store_name,
	(
		select count(*)
		from sales.funnel as fun2
		where fun2.visit_page_date <= fun.visit_page_date
			and fun2.store_id = fun.store_id
	) as visitas_acumuladas
from sales.funnel as fun
left join sales.stores as sto
	on fun.store_id = sto.store_id
order by sto.store_name, fun.visit_page_date


-- RESUMO ##########################################################################
-- (1) Servem para consultar dados de outras consultas.
-- (2) Para que as subqueries no WHERE e no SELECT funcionem, elas devem retornar 
-- apenas um único valor
-- (3) Não é recomendado utilizar subqueries diretamente dentro do FROM pois isso 
-- dificulta a legibilidade da query. 

-- 8.2 - EXEMPLOS DE SUBQUERY

-- EXEMPLOS ########################################################################

-- (Exemplo 1) Análise de recorrência dos leads
-- Calcule o volume de visitas por dia ao site separado por 1ª visita e demais visitas

with primeira_visita as (

	select customer_id, min(visit_page_date) as visita_1
	from sales.funnel
	group by customer_id

)

select
	fun.visit_page_date,
	(fun.visit_page_date <> primeira_visita.visita_1) as lead_recorrente,
	count(*)

from sales.funnel as fun
left join primeira_visita
	on fun.customer_id = primeira_visita.customer_id
group by fun.visit_page_date, lead_recorrente
order by fun.visit_page_date desc, lead_recorrente




-- (Exemplo 2) Análise do preço versus o preço médio
-- Calcule, para cada visita ao site, quanto o preço do um veículo visitado pelo cliente
-- estava acima ou abaixo do preço médio dos veículos daquela marca 
-- (levar em consideração o desconto dado no veículo)

with preco_medio as (

	select brand, avg(price) as preco_medio_da_marca
	from sales.products
	group by brand

)

select
	fun.visit_id,
	fun.visit_page_date,
	pro.brand,
	(pro.price * (1+fun.discount)) as preco_final,
	preco_medio.preco_medio_da_marca,
	((pro.price * (1+fun.discount)) - preco_medio.preco_medio_da_marca) as preco_vs_media

from sales.funnel as fun
left join sales.products as pro
	on fun.product_id = pro.product_id
left join preco_medio
	on pro.brand = preco_medio.brand

--###############################################################################################
-- DESAFIO AULA 08 - SUBQUERYS ######################################################################
--###############################################################################################

-- EXERCÍCIOS ########################################################################

-- (Exercício 1) Crie uma coluna calculada com o número de visitas realizadas por cada
-- cliente da tabela sales.customers

-- resolução wendel 
select 
	--c.first_name || ' ' || c.last_name as fullname
	--,c.customer_id
	c.* 
	,count(*) as contagem
from sales.funnel f 
inner join sales.customers c on f.customer_id = c.customer_id 
group by c.customer_id 
order by contagem desc 

-- resolução curso

with numero_de_visitas as (

	select customer_id, count(*) as n_visitas
	from sales.funnel
	group by customer_id
	order by n_visitas desc

)
select
	cus.*,
	n_visitas
from sales.customers as cus
left join numero_de_visitas as ndv
	on cus.customer_id = ndv.customer_id
--where cus.first_name = 'SHEYLLA' and cus.last_name = 'DUARTE' 
order by n_visitas desc 


--###############################################################################################
-- AULA 09 - TRATAMENTO DE DADOS ################################################################
--###############################################################################################


-- 9.1 - TIPOS DE CONVERSÃO (Data, número e texto) ####################################################

-- Operador ::
-- Operador CAST

-- EXEMPLOS ########################################################################

-- (Exemplo 1) Conversão de texto em data
-- Corrija a query abaixo utilizando o operador ::
select '2021-10-01' - '2021-02-01'
select '2021-10-01'::date - '2021-02-01'::date

select nome_coluna::date
from nome_tabela


-- (Exemplo 2) Conversão de texto em número
-- Corrija a query abaixo utilizando o operador ::

select '100' - '10'
select '100'::numeric - '10'::numeric


-- (Exemplo 3) Conversão de número em texto
-- Corrija a query abaixo utilizando o operador ::
select replace(112122,'1','A')
select replace(112122::text,'1','A')


-- (Exemplo 4) Conversão de texto em data
-- Corrija a query abaixo utilizando a função CAST
select '2021-10-01' - '2021-02-01'
select cast('2021-10-01' as date) - cast('2021-02-01' as date)

select '100' - '10'
select cast('100' as numeric) - cast('10' as numeric)

select replace(112122,'1','A')
select replace(cast (112122 as text),'1','A')

-- RESUMO ##########################################################################
-- (1) O operador :: e o CAST() são funções utilizadas para converter um dado para 
-- a unidade desejada. 
-- (2) O operador :: é mais "clean", porém, em algumas ocasiões não funciona, sendo
-- necessário utilizar a função CAST()
-- (3) Use o Guia de comandos para consultar a lista de unidades mais utilizadas


-- 9.2 - TIPOS DE CONVERSÃO (Case e Colalesce) ############################################

-- CASE WHEN
-- COALESCE()


-- EXEMPLOS ########################################################################

-- (Exemplo 1) Agrupamento de dados com CASE WHEN
-- Calcule o nº de clientes que ganham abaixo de 5k, entre 5k e 10k, entre 10k e 
-- 15k e acima de 15k

with faixa_de_renda as (
	select
		income,
		case
			when income < 5000 then '0-5000'
			when income >= 5000 and income < 10000 then '5000-10000'
			when income >= 10000 and income < 15000 then '10000-15000'
			else '15000+'
			end as faixa_renda
	from sales.customers
)
select faixa_renda, count(*)
from faixa_de_renda
group by faixa_renda


-- (Exemplo 2) Tratamento de dados nulos com COALESCE
-- Crie uma coluna chamada populacao_ajustada na tabela temp_tables.regions e
-- preencha com os dados da coluna population, mas caso esse campo estiver nulo, 
-- preencha com a população média (geral) das cidades do Brasil
select * from temp_tables.regions limit 10

-- Opção 1
select
	*,
	case
		when population is not null then population
		else (select avg(population) from temp_tables.regions)
		end as populacao_ajustada

from temp_tables.regions

-- Opção 2
select
	*,
	coalesce(population, (select avg(population) from temp_tables.regions)) as populacao_ajustada
	
from temp_tables.regions


-- RESUMO ##########################################################################
-- (1) CASE WHEN é o comando utilizado para criar respostas específicas para 
-- diferentes condições e é muito utilizado para fazer agrupamento de dados
-- (2) COALESCE é o comando utilizado para preencher campos nulos com o primeiro
-- valor não nulo de uma sequência de valores.


-- 9.3 - TIPOS DE CONVERSÃO (minusculo, maiusculo, revover espaço em branco e substuir padrões) ############################################
-- LOWER()
-- UPPER()
-- TRIM()
-- REPLACE()

-- EXEMPLOS ########################################################################

-- (Exemplo 1) Corrija o primeiro elemento das queries abaixo utilizando os comandos 
-- de tratamento de texto para que o resultado seja sempre TRUE 

select 'São Paulo' = 'SÃO PAULO'
select upper('São Paulo') = 'SÃO PAULO'


select 'São Paulo' = 'são paulo'
select lower('São Paulo') = 'são paulo'


select 'SÃO PAULO     ' = 'SÃO PAULO'
select trim('SÃO PAULO     ') = 'SÃO PAULO'


select 'SAO PAULO' = 'SÃO PAULO'
select replace('SAO PAULO', 'SAO', 'SÃO') = 'SÃO PAULO'


-- RESUMO ##########################################################################
-- (1) LOWER() é utilizado para transformar todo texto em letras minúsculas
-- (2) UPPER() é utilizado para transformar todo texto em letras maiúsculas
-- (3) TRIM() é utilizado para remover os espaços das extremidades de um texto
-- (4) REPLACE() é utilizado para substituir uma string por outra string

-- 9.4 - TIPOS DE CONVERSÃO (intervalo datas, trucar (selecionar apenas um período) extrair datas, diferença de datas) ############################################
-- INTERVAL
-- DATE_TRUNC
-- EXTRACT
-- DATEDIFF


-- EXEMPLOS ########################################################################

-- (Exemplo 1) Soma de datas utilizando INTERVAL
-- Calcule a data de hoje mais 10 unidades (dias, semanas, meses, horas)

select current_date + 10
select (current_date + interval '10 days')::date
select (current_date + interval '10 weeks')::date
select (current_date + interval '10 months')::date
select current_date + interval '10 hours'



-- (Exemplo 2) Truncagem de datas utilizando DATE_TRUNC
-- Calcule quantas visitas ocorreram por mês no site da empresa

select visit_page_date, count(*)
from sales.funnel
group by visit_page_date
order by visit_page_date desc

select
	date_trunc('month', visit_page_date)::date as visit_page_month,
	count(*)
from sales.funnel
group by visit_page_month
order by visit_page_month desc


-- (Exemplo 3) Extração de unidades de uma data utilizando EXTRACT
-- Calcule qual é o dia da semana que mais recebe visitas ao site


select
	extract('dow' from visit_page_date) as dia_da_semana,
	count(*)
from sales.funnel
group by dia_da_semana
order by dia_da_semana


-- (Exemplo 4) Diferença entre datas com operador de subtração (-) 
-- Calcule a diferença entre hoje e '2018-06-01', em dias, semanas, meses e anos.

select (current_date - '2018-06-01')
select (current_date - '2018-06-01')/7
select (current_date - '2018-06-01')/30
select (current_date - '2018-06-01')/365

select datediff('weeks', '2018-06-01', current_date)



-- RESUMO --------------------------------------------------------------------------
-- (1) O comando INTERVAL é utilizado para somar datas na unidade desejada. Caso a 
-- unidade não seja informada, o SQL irá entender que a soma foi feita em dias.
-- (2) O comando DATE_TRUNC é utilizado para truncar uma data no início do período
-- (3) O comando EXTRACT é utilizado para extrair unidades de uma data/timestamp
-- (4) O cálculo da diferença entre datas com o operador de subtração (-) retorna  
-- valores em dias. Para calcular a diferença entre datas em outra unidade é necessário
-- fazer uma transformação de unidades (ou criar uma função para isso)
-- (5) Utilize o Guia de comandos para consultar as unidades de data e hora utilizadas 
-- no SQL

-- 9.5 - FUNÇÕES PERSONALIZADAS ############################################


-- PARA QUE SERVEM #################################################################
-- Servem para criar comandos personalizados de scripts usados recorrentemente.


-- EXEMPLOS ########################################################################

-- (Exemplo 1) Crie uma função chamada DATEDIFF para calcular a diferença entre
-- duas datas em dias, semanas, meses, anos

select (current_date - '2018-06-01')
select (current_date - '2018-06-01')/7
select (current_date - '2018-06-01')/30
select (current_date - '2018-06-01')/365

select datediff('weeks', '2018-06-01', current_date)

create function datediff(unidade varchar, data_inicial date, data_final date)
returns integer
language sql

as

$$

	select
		case
			when unidade in ('d', 'day', 'days') then (data_final - data_inicial)
			when unidade in ('w', 'week', 'weeks') then (data_final - data_inicial)/7
			when unidade in ('m', 'month', 'months') then (data_final - data_inicial)/30
			when unidade in ('y', 'year', 'years') then (data_final - data_inicial)/365
			end as diferenca

$$

select datediff('d', '1982-09-05', current_date)



-- (Exemplo 2) Delete a função DATEDIFF criada no exercício anterior

drop function datediff


-- RESUMO ##########################################################################
-- (1) Para criar funções, utiliza-se o comando CREATE FUNCTION
-- (2) Para que o comando funcione é obrigatório informar (a) quais as unidades dos 
-- INPUTS (b) quais as unidades dos OUTPUTS e (c) em qual linguagem a função será escrita
-- (3) O script da função deve estar delimitado por $$
-- (4) Para deletar uma função utiliza-se o comando DROP FUNCTION


--###############################################################################################
-- AULA 10 - MANIPULAÇÃO DE TABELAS ################################################################
--###############################################################################################

--10.1 - TABELAS, CRIAÇÃO E DELEÇÃO

-- CONTEÚDO ########################################################################
-- Criação de tabela a partir de uma query
-- Criação de tabela a partir do zero
-- Deleção de tabelas


-- EXEMPLOS ########################################################################

-- (Exemplo 1) Criação de tabela a partir de uma query
-- Crie uma tabela chamada customers_age com o id e a idade dos clientes. 
-- Chame-a de temp_tables.customers_age

select
	customer_id,
	datediff('years', birth_date, current_date) idade_cliente
	into temp_tables.customers_age
from sales.customers

select *
from temp_tables.customers_age

-- (Exemplo 2) Criação de tabela a partir do zero
-- Crie uma tabela com a tradução dos status profissionais dos clientes. 
-- Chame-a de temp_tables.profissoes

select distinct professional_status
from sales.customers

create table temp_tables.profissoes (
	professional_status varchar,
	status_profissional varchar
)

select * from temp_tables.profissoes

insert into temp_tables.profissoes
(professional_status, status_profissional)

values
('freelancer', 'freelancer'),
('retired', 'aposentado(a)'),
('clt', 'clt'),
('self_employed', 'autônomo(a)'),
('other', 'outro'),
('businessman', 'empresário(a)'),
('civil_servant', 'funcionário público(a)'),
('student', 'estudante')

select * from temp_tables.profissoes

-- (Exemplo 3) Deleção de tabelas
-- Delete a tabela temp_tables.profissoes

drop table temp_tables.profissoes

-- RESUMO ##########################################################################
-- (1) Para criar tabelas a partir de uma query basta escrever a query normalmente e
-- colocar o comando INTO antes do FROM informando o schema e o nome da tabela 
-- a ser criada
-- (2) Para criar tabelas a partir do zero é necessário (a) criar uma tabela vazia 
-- com o comando CREATE TABLE (b) Informar que valores serão inseridos com o comando
-- INSERT INTO seguido do nome das colunas (c) Inserir os valores manualmente em forma 
-- de lista após o comando VALUES
-- (3) Para deletar uma tabela utiliza-se o comando DROP TABLE

-- 10.2 - LINHAS, INSERÇÃO, ATUALIZAÇÃO E DELEÇÃO

-- CONTEÚDO ########################################################################
-- Inserção de linhas
-- Atualização de linhas
-- Deleção de linhas


-- EXEMPLOS ########################################################################

-- (Exemplo 1) Inserção de linhas
-- Insira os status 'desempregado(a)' e 'estagiário(a)' na temp_table.profissoes

create table temp_tables.profissoes (
	professional_status varchar,
	status_profissional varchar
);

insert into temp_tables.profissoes
(professional_status, status_profissional)

values
('freelancer', 'freelancer'),
('retired', 'aposentado(a)'),
('clt', 'clt'),
('self_employed', 'autônomo(a)'),
('other', 'outro'),
('businessman', 'empresário(a)'),
('civil_servant', 'funcionário público(a)'),
('student', 'estudante')

select * from temp_tables.profissoes

insert into temp_tables.profissoes
(professional_status, status_profissional)

values
('unemployed', 'desempregado(a)'),
('trainee', 'estagiario(a)')


-- (Exemplo 2) Atualização de linhas
-- Corrija a tradução de 'estagiário(a)' de 'trainee' para 'intern' 

update temp_tables.profissoes
set professional_status = 'intern'
where status_profissional = 'estagiario(a)'

select * from temp_tables.profissoes



-- (Exemplo 3) Deleção de linhas
-- Delete as linhas dos status 'desempregado(a)' e 'estagiário(a)'

delete from temp_tables.profissoes
where status_profissional = 'desempregado(a)'
or status_profissional = 'estagiario(a)'

select * from temp_tables.profissoes



-- RESUMO ##########################################################################
-- (1) Para inserir linhas em uma tabela é necessário (a) Informar que valores serão 
-- inseridos com o comando INSERT INTO seguido do nome da tabela e nome das colunas 
-- (b) Inserir os valores manualmente em forma de lista após o comando VALUES
-- (2) Para atualizar as linhas de uma tabela é necessário (a) Informar qual tabela
-- será atualizada com o comando UPDATE (b) Informar qual o novo valor com o comando SET 
-- (c) Delimitar qual linha será modificada utilizando o filtro WHERE
-- (3) Para deletar linhas de uma tabela é necessário (a) Informar de qual tabela as
-- linhas serão deletadas com o comando DELETE FROM (b) Delimitar qual linha será 
-- deletada utilizando o filtro WHERE


-- 10.3 - COLUNAS, INSERÇÃO, ATUALIZAÇÃO E DELEÇÃO

-- CONTEÚDO ########################################################################
-- Inserção de colunas
-- Alteração de colunas
-- Deleção de colunas


-- EXEMPLOS ########################################################################

-- (Exemplo 1) Inserção de Colunas
-- Insira uma coluna na tabela sales.customers com a idade do cliente
alter table sales.customers
add customer_age int

select * from sales.customers limit 10

update sales.customers
set customer_age = datediff('years', birth_date, current_date)
where true


-- (Exemplo 2) Alteração do tipo da coluna
-- Altere o tipo da coluna customer_age de inteiro para varchar
alter table sales.customers
alter column customer_age type varchar

select * from sales.customers limit 10

-- (Exemplo 3) Alteração do nome da coluna
-- Renomeie o nome da coluna "customer_age" para "age"
alter table sales.customers
rename column customer_age to age

select * from sales.customers limit 10

-- (Exemplo 4) Deleção de coluna
-- Delete a coluna "age"

alter table sales.customers
drop column age


select * from sales.customers limit 10

-- RESUMO ##########################################################################
-- (1) Para fazer qualquer modificação nas colunas de uma tabela utiliza-se o comando 
-- ALTR TABLE seguido do nome da tabela
-- (2) Para adicionar colunas utiliza-se o comando ADD seguido do nome da coluna e da
-- unidade da nova coluna
-- (3) Para mudar o tipo de unidade de uma coluna utiliza-se o comando ALTER COLUMN 
-- (4) Para renomear uma coluna utiliza-se o comando RENAME COLUMN
-- (5) Para deletar uma coluna utiliza-se o comando DROP COLUMN
