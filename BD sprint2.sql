use sprint2;

-- Criar tabela calculo_financeiro
create table calculo_financeiro (
    idCalculo_financeiro int primary key auto_increment,
    valor_servico decimal(10, 2),
    qtd_clientes_por_dia int,
    clientes_perdidos int,
    dias_operacao_mes int,
    idUsuario int
);

-- Criar tabela usuario
create table usuario (
    idUsuario int primary key auto_increment,
    nome_completo varchar(255),
    email varchar(255),
    data_nascimento date
);
desc usuario;


-- Adicionar chave-estrangeira
alter table calculo_financeiro
add constraint fk_usuario
foreign key (idUsuario) references usuario(idUsuario);

-- Inserir dados na tabela usuario
insert into usuario (nome_completo, email, data_nascimento)
values
    ('Harry Potter', 'harrypotter@gmail.com', '1995-09-13'),
    ('Hermione Granger', 'hermionegranger@gmail.com', '1995-03-09'),
    ('Rony Weasley', 'ronyweasley@gmail.com', '1995-11-06');

-- Inserir dados na tabela calculo_financeiro
insert into calculo_financeiro (valor_servico, qtd_clientes_por_dia, clientes_perdidos, dias_operacao_mes, idUsuario)
values
    (400, 20, 5, 22, 1),
    (350, 15, 3, 20, 2),
    (500, 25, 6, 25, 3);

-- Exibir dados da tabela calculo_financeiro
select * from calculo_financeiro;

-- Exibir dados da tabela usuario
select * from usuario;

-- Exibir dados com alias (AS)
select u.nome_completo as nome, 
       u.email as email, 
       c.valor_servico as 'Valor do serviço', 
       c.qtd_clientes_por_dia as 'Clientes por dia' 
from usuario u 
join calculo_financeiro c on u.idUsuario = c.idUsuario;


-- Exibir dados com CASE
select u.nome_completo as nome,
       c.valor_servico as 'Valor do serviço',
       case when c.valor_servico > 450 then 'Alto'
            when c.valor_servico between 300 and 450 then 'Média'
            else 'Baixo' 
       end as 'Categoria de serviço'
from usuario u 
join calculo_financeiro c on u.idUsuario = c.idUsuario;

-- Exibir dados com IFNULL
select u.nome_completo as nome,
       ifnull(u.email, 'Email não informado') as email, 
       c.valor_servico as 'Valor do serviço' 
from usuario u 
join calculo_financeiro c on u.idUsuario = c.idUsuario;
