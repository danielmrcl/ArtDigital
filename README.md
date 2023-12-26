# ArtDigital

### Sobre o projeto

O projeto é voltado para a área do artesanato, com intuito de proporcionar comodidade e novas oportunidades para artistas regionais, disponibilizando uma plataforma onde os artesãos irão divulgar suas obras de artes que poderão ser vendidas em todo o território nacional.

Uma quantidade massiva de artesãos produz suas obras e enfrentam dificuldade em divulgá-las para venda. A ideia do projeto é criar uma plataforma que faça o elo entre apreciadores da arte, possíveis compradores, e os artesãos, fornecedores. A interação com a ferramenta será simples e de rápido aprendizado.

Créditos:
- Scrum Master – José Douglas <br />
- Documentação – Jefferson Queiroz <br />
- Banco de dados – Ellis Costa <br />
- Desenvolvedor – André Luan <br />
- Desenvolvedor – Daniel Marcelo <br />

Em uma simples tela de cadastro de produtos, o fornecedor em poucos cliques irá inserir fotos detalhadas e a descrição dos produtos que deseja divulgar na plataforma. Na mesma tela, o site irá solicitar dados relacionados ao custo de produção da arte e estipulará um valor para venda. Uma vez que o vendedor não concorde com o valor estabelecido, ele terá a liberdade de colocar o preço que julgar adequado. Será cobrado uma taxa de comissão de venda sobre o valor do pedido total, percentual de 10% nas compras que forem realizadas pelo Artdigital Pay e o impulso de produtos que permite melhorar a classificação de busca dos produtos, aumentando o número de visualizações e venda em potencial. Será cobrado valores estipulados em tabela, podem impulsionar entre 7, 15 e 30 dias com os seguintes valores:

|  Quant. Dias  |Valores do Impulsionamento  |                                          
|:-------------:|:--------------------------:|
|       7       |    R$ 9,99                 |
|      15       |    R$ 19,99                |            
|      30       |    R$ 29,99                |         

### Subindo o projeto

Requisitos:
- [Java 17](https://jdk.java.net/17/)
- [Maven](https://maven.apache.org/)
- [docker](https://www.docker.com/get-started/)

Seguindo este guia o projeto utilizara o banco de dados padrão H2 em memória. Caso queira utilizar outro banco deve ser alterado as variáveis de ambiente no arquivo `compose.yaml`.

1. Criar pacote do projeto em `target/ROOT.war`
```bash
mvn package
```

2. Rodar o projeto pelo arquivo `.war` com docker:
```bash
docker compose up
```
