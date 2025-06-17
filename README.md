MEMBROS DO GRUPO: CARLOS ROSEMBERG, JULIA TATIM, ERIC BINEK, MARIA EDUARDA MELO BARBOSA, GUILHERME

LINK DO VIDEO: https://youtu.be/-k57j-tL87Y

  Descrição geral do aplicativo

é um aplicativo iOS desenvolvido em SwiftUI que permite ao usuário visualizar uma lista de Pokémons, buscar por nome, visualizar detalhes de cada Pokémon e salvar seus favoritos. O app conta também com sistema de *cadastro* e *login*, permitindo que cada usuário tenha sua lista de favoritos personalizada.

---

## 📡 Escolha da API

API utilizada:PokéAPi

 Justificativa:

Escolhemos a PokéAPI por ser uma API pública, gratuita e com um amplo banco de dados com informações detalhadas de cada Pokémon, incluindo nome, tipos, altura, peso e imagens. Além de ser a recomendada pelo professor 

Como usamos a API:

- **Listagem de Pokémons:** Paginação com carregamento incremental (20 Pokémons por vez).
- **Detalhes de cada Pokémon:** Busca individual ao clicar em um Pokémon.
- **Imagem, altura, peso e tipos:** Coletados via endpoint de detalhes.

Dados utilizados:

- Nome
- URL da imagem (sprite)
- Altura
- Peso
- Tipos

---

## 🏛️ Arquitetura do aplicativo (MVVM)

O projeto segue a arquitetura **MVVM (Model-View-ViewModel)**.

Diagrama Simplificado:
 Camadas:

- **Model:**  
  - Estruturas de dados (`PokemonEntry`, `PokemonDetails`, `Favorito`, `Usuario`).
  - Persistência com Core Data (favoritos e usuários).

- **ViewModel:**  
  - Lógica de negócios.
  - Requisições para a API.
  - Comunicação com o Core Data.
  - Controle de estado da UI.

- **View:**  
  - Interface gráfica (SwiftUI).
  - Telas de Login, Cadastro, Lista de Pokémons, Detalhe e Favoritos.

---

 Implementação do Core Data (Persistência)

 Modelo de Dados:

Entidades criadas:

- **Usuario**
  - email: String
  - senha: String
  - nomeUsuario: String

- **Favorito**
  - uid: String (ID único do Pokémon)
  - nomePokemon: String
  - imagemUrl: String
  - userId: String (referência ao usuário dono do favorito)

 Como os dados são salvos:

- **adastro de usuário:* 
Armazena os dados na entidade `Usuario`.

- *Login:* 
Faz a validação comparando os dados digitados com os registros do Core Data.

- **avoritar Pokémon:*  
Salva o Pokémon na entidade `Favorito`, vinculado ao `userId` do usuário logado.

 Como os dados são buscados:

- No Login:  
Busca por email e senha.

- Na tela de Favoritos:  
Filtra os favoritos pelo `userId` do usuário logado.

- Na verificação de favorito:  
Filtra por `uid` do Pokémon e `userId`.

---

 Implementação dos Design Tokens

*Design Tokens* foram definidos em uma estrutura centralizada chamada `DesignTokens`, seguindo boas práticas de Design System.

 Exemplos de tokens criados:

- **Cores:**  
```swift
struct Colors {
    static let background = Color(.systemBackground)
    static let text = Color.primary
    static let cardBackground = Color(.secondarySystemBackground)
    static let buttonBackground = Color.blue
    static let buttonText = Color.white
    static let border = Color.gray
}  
Bibliotecas de terceiros utilizadas
Nenhuma.
Todo o projeto foi desenvolvido apenas com recursos nativos do SwiftUI e CoreData, utilizando URLSession para chamadas de API.

Funcionalidades gerais
Tela de Login

Tela de Cadastro

Listagem de Pokémons com scroll infinito

Pesquisa por nome

Detalhes do Pokémon

Favoritar/Desfavoritar Pokémon

Tela com lista de favoritos por usuário

Design adaptativo e responsivo para diferentes tamanhos de tela
