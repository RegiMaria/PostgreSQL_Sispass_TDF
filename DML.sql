INSERT INTO saude.especialidade (nome,descricao)
VALUES
('Cardiologia', 'Diagnóstico e tratamento de doenças relacionadas ao coração e ao sistema cardiovascular.'),
('Ortopedia', 'Trata lesões e doenças relacionadas ao sistema musculoesquelético, incluindo ossos, músculos, articulações, tendões e ligamentos.'),
('Pediatria', 'Concentra-se na saúde e no desenvolvimento de crianças, desde o nascimento até a adolescência. Os pediatras lidam com uma ampla gama de questões de saúde infantil.'),
('Ginecologia', 'Trata da saúde do sistema reprodutivo feminino, incluindo órgãos como o útero, os ovários e a vagina, além de questões relacionadas à saúde sexual e reprodutiva da mulher.'),
('Neurologia', 'Diagnóstico e tratamento de distúrbios do sistema nervoso, incluindo o cérebro, a medula espinhal e os nervos periféricos.'),
('Dermatologia', 'Diagnóstico e tratamento de doenças da pele, cabelo e unhas, além de problemas relacionados à saúde da pele, como acne, eczema e câncer de pele.'),
('Oftalmologia', 'Diagnóstico e tratamento de doenças e distúrbios relacionados aos olhos e à visão.'),
('Otorrinolaringologia', 'Diagnóstico e tratamento de distúrbios do ouvido, nariz, garganta, cabeça e pescoço, incluindo problemas de audição, respiração, fala e equilíbrio.'),
('Urologia', 'Trata de doenças do trato urinário em homens e mulheres, além de distúrbios do sistema reprodutor masculino.'),
('Endocrinologia', 'Diagnóstico e tratamento de distúrbios hormonais, incluindo diabetes, doenças da tireoide e distúrbios metabólicos.'),
('Oncologia', 'Diagnóstico e tratamento de câncer, incluindo terapias como quimioterapia, radioterapia e imunoterapia.'),
('Psiquiatria', 'Diagnóstico e tratamento de distúrbios mentais, incluindo depressão, ansiedade, esquizofrenia e transtorno bipolar.'),
('Cirurgia Geral', 'Abrange uma ampla gama de procedimentos cirúrgicos, incluindo cirurgias abdominais, de mama, de tireoide e de emergência.'),
('Radiologia', 'Técnicas de imagem, como raios-X, ressonância magnética e tomografia computadorizada, para diagnosticar e tratar doenças e lesões.'),
('Infectologia', 'Diagnóstico, prevenção e tratamento de doenças infecciosas causadas por bactérias, vírus, fungos e parasitas.'),
('Hematologia', 'Trata de doenças relacionadas ao sangue, incluindo distúrbios da coagulação, anemias e cânceres do sangue, como leucemia e linfoma.'),
('Nefrologia', 'Especialidade médica que trata de doenças dos rins, incluindo insuficiência renal, hipertensão arterial e distúrbios eletrolíticos.'),
('Reumatologia', 'Concentra-se no diagnóstico e tratamento de distúrbios do sistema musculoesquelético e do sistema imunológico, como artrite, lúpus e fibromialgia.'),
('Pneumologia', 'Envolvida no diagnóstico e tratamento de doenças respiratórias, como asma, bronquite, enfisema e pneumonia.'),
('Hepatologia', 'Diagnóstico e tratamento das doenças do fígado, vesícula biliar, ductos biliares e das vias biliares.');

SELECT nome, descricao
FROM saude.especialidade;
-- Retorna os campos da tabela pessoas.pessoa:
SELECT column_name
FROM information_schema.columns
WHERE table_schema = 'pessoas' AND table_name = 'pessoa';

-- insere dados de paciente na tabela pessoas.pessoa
INSERT INTO pessoas.pessoa (nome,cpf,email, telefone, data_cadastro)
VALUES 
('Ana Julia Moraes','273.498.651-55','jumorais@example.com','(55)84 0413-5930', 2019-04-11);

INSERT INTO pessoas.paciente (cartao_sus, autorizacao_laudo_medico, id_pessoa, id_viagem, id_tipo_transporte, id_especialidade)
VALUES ('1234567890', 'AUT123', 1, 1, 1, 1); -- Supondo que o paciente é associado ao ID 1 na tabela pessoa e viagem, tipo_transporte e especialidade.
