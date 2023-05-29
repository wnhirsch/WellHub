# WellHub

O WellHub é um Visualizador de Usuários do Github para dispositivos iOS desenvolvido em Swift utilizando o Xcode. Ele permite visualizar informações de usuários do Github, como detalhes pessoais e repositórios públicos.

## Tecnologias utilizadas

- Swift: Linguagem de programação utilizada para desenvolver o aplicativo.
- Xcode: Ambiente de desenvolvimento integrado (IDE) utilizado para codificar, testar e implantar o aplicativo iOS.
- Cocoapods: Gerenciador de dependências utilizado para instalar as frameworks necessárias.
- RxSwift: Framework reativa utilizada para programação assíncrona e manipulação de eventos.
- Moya: Biblioteca utilizada para abstrair as requisições de API e facilitar a comunicação com a API do Github.
- Alamofire: Biblioteca utilizada para realizar as requisições HTTP.
- Kingfisher: Biblioteca utilizada para fazer o download e cache de imagens a partir das URLs fornecidas.

## Instalação

1. Certifique-se de ter o Xcode instalado em sua máquina.
2. Clone o repositório do projeto.
3. Navegue até o diretório raiz do projeto no terminal.
4. Execute o comando `pod install` para instalar as dependências.

Claro! Vamos adicionar essa instrução no arquivo Readme.md. Aqui está o trecho atualizado:

## Uso

1. Abra o arquivo `.xcworkspace` do projeto no Xcode.
2. Construa e execute o aplicativo em um simulador ou dispositivo iOS.
3. Na tela inicial, será exibida uma lista de todos os usuários do Github, em ordem crescente de criação de conta.
4. Ao tocar em um usuário, você será redirecionado para a tela de detalhes do usuário.
5. Na tela de detalhes, você encontrará informações como o número de seguidores, empresa em que trabalha, blog e localização.
6. Também serão apresentados os repositórios públicos do usuário.

**Importante**: Para evitar ser barrado pela API do Github devido a limites de taxa, é recomendado substituir o token de login padrão da API por um token pessoal. Para isso, siga as instruções abaixo:

1. Abra o arquivo `APIHost.swift` do projeto.
2. Procure pela linha de código que contém o token de login: 

```swift
static var accessToken: String {
    "YOUR_ACCESS_TOKEN"
}
```

3. Substitua `"YOUR_ACCESS_TOKEN"` pelo seu token pessoal de login da API do Github.
4. Salve as alterações no arquivo.

Certifique-se de obter um token pessoal válido da API do Github para garantir o acesso adequado às requisições. Maiores detalhes podem ser encontrados [nesse tutorial](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/creating-a-personal-access-token#creating-a-personal-access-token-classic).

## Contato

Se você tiver dúvidas, sugestões ou quiser entrar em contato, pode me encontrar no Github [@wnhirsch](https://github.com/wnhirsch) ou através do meu e-mail wnhirsch@inf.ufrgs.br.