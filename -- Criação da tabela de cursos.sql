-- Criação da tabela de cursos
CREATE TABLE cursos (
    id INT AUTO_INCREMENT PRIMARY KEY, -- Identificador único do curso
    nome VARCHAR(100) NOT NULL, -- Nome do curso
    descricao TEXT, -- Descrição do curso
    duracao INT -- Duração do curso em horas
);

-- Criação da tabela de alunos
CREATE TABLE alunos (
    id INT AUTO_INCREMENT PRIMARY KEY, -- Identificador único do aluno
    nome VARCHAR(100) NOT NULL, -- Nome do aluno
    email VARCHAR(100) UNIQUE NOT NULL, -- E-mail do aluno
    telefone VARCHAR(15) -- Telefone do aluno
);

-- Criação da tabela de inscrições
CREATE TABLE inscricoes (
    id INT AUTO_INCREMENT PRIMARY KEY, -- Identificador único da inscrição
    aluno_id INT, -- Identificador do aluno
    curso_id INT, -- Identificador do curso
    data_inscricao DATE, -- Data da inscrição
    FOREIGN KEY (aluno_id) REFERENCES alunos(id), -- Relacionamento com a tabela alunos
    FOREIGN KEY (curso_id) REFERENCES cursos(id) -- Relacionamento com a tabela cursos
);

-- Inserção de dados na tabela de cursos
INSERT INTO cursos (nome, descricao, duracao) VALUES
('Introdução ao SQL', 'Curso básico sobre SQL para iniciantes.', 40),
('Desenvolvimento Web', 'Curso avançado sobre desenvolvimento web com foco em front-end e back-end.', 60);

-- Inserção de dados na tabela de alunos
INSERT INTO alunos (nome, email, telefone) VALUES
('João Silva', 'joao.silva@email.com', '123456789'),
('Maria Oliveira', 'maria.oliveira@email.com', '987654321');

-- Inserção de dados na tabela de inscrições
INSERT INTO inscricoes (aluno_id, curso_id, data_inscricao) VALUES
(1, 1, '2024-08-01'),
(2, 2, '2024-08-02');

-- Consulta para listar todos os cursos
SELECT * FROM cursos;

-- Consulta para listar todos os alunos
SELECT * FROM alunos;

-- Consulta para listar todas as inscrições
SELECT * FROM inscricoes;

-- Consulta para listar inscrições com detalhes dos alunos e cursos
SELECT
    i.id AS inscricao_id,
    a.nome AS aluno_nome,
    c.nome AS curso_nome,
    i.data_inscricao
FROM inscricoes i
JOIN alunos a ON i.aluno_id = a.id
JOIN cursos c ON i.curso_id = c.id;

-- Atualização da descrição do curso 'Introdução ao SQL'
UPDATE cursos
SET descricao = 'Curso básico sobre SQL com prática intensiva.'
WHERE nome = 'Introdução ao SQL';

-- Exclusão de um aluno (por exemplo, com id 1)
DELETE FROM alunos
WHERE id = 1;
