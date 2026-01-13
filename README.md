# Pulse Post

O Pulse Post é um aplicativo de feed de postagens inspirado no Instagram, desenvolvido como parte de um teste técnico, com o objetivo de demonstrar meus conhecimentos em Flutter, arquitetura de software e boas práticas de desenvolvimento.

O projeto foi concebido e implementado em um período de 5 dias, priorizando organização, escalabilidade e clareza arquitetural.

Ao explorar as branches do repositório, é possível acompanhar a evolução do sistema e entender as decisões técnicas adotadas ao longo do desenvolvimento.

## Tecnologias e Abordagens

O aplicativo foi desenvolvido seguindo a abordagem arquitetural MVVM (Model–View–ViewModel), com separação clara de responsabilidades em camadas. Para o gerenciamento de estado, foi utilizado o MobX, enquanto o GetIt foi adotado como gerenciador de dependências, promovendo modularidade e desacoplamento.

Para comunicação com o backend (desenvolvido em Spring Boot), utilizei o Dio como cliente HTTP. Os arquivos de mídia (imagens e vídeos) são armazenados no Cloudinary, garantindo eficiência e escalabilidade no armazenamento.

O projeto permite que o usuário:

Tire fotos diretamente com a câmera do smartphone Android;

Faça upload de imagens e vídeos armazenados localmente no dispositivo.

A navegação entre telas é gerenciada com o GoRouter, proporcionando uma estrutura de rotas mais organizada e previsível. Para a persistência segura de dados sensíveis de autenticação, foi utilizado o Flutter Secure Storage.

Além disso, o Envied foi empregado para proteger informações sensíveis, como a baseUrl do backend. O projeto também conta com diversas validações, aplicadas tanto nos controllers quanto por meio do uso de Validators, garantindo maior confiabilidade dos dados.

Por fim, foi desenvolvida uma UI Kit própria, seguindo a metodologia Atomic Design, com foco na reutilização de componentes, padronização visual e escalabilidade da interface.

## Arquitetura

Conforme mencionado, o projeto segue a arquitetura MVVM, organizada em camadas bem definidas:

### MVVM – Model, View e ViewModel

#### Domain

Camada responsável pela lógica de negócio da aplicação.

- DTOs: Transferência e mapeamento de dados

- Repositories: Definição das interfaces das regras de negócio

- Enums: Enumeradores utilizados para controle e padronização de estados

#### Data

- Camada responsável pela integração com serviços externos e fontes de dados locais.

- Repositories: Implementação das interfaces definidas no Domain

- Services: Conexões com serviços externos e locais

- Interceptors: Interceptadores (ex.: autenticação)

- Exceptions: Lançamento e tratamento de exceções

#### Presentation

Camada responsável pela interface e interação com o usuário, organizada em módulos.

- Controllers: Gerenciamento de estado da aplicação

- ViewModels: Intermediação entre a lógica de negócio e a interface

- Pages: Telas e widgets da aplicação

#### Utils

Utilitários gerais, como constantes, APIs e navegação.

##### Arquivos principais:

app_bindings.dart: Registro e gerenciamento das dependências do sistema

app_routes.dart: Definição das rotas de navegação

app_widget.dart: Ponto central de inicialização da aplicação

## Inicialização

Primeiramente, instale todas as configurações do flutter em sua máquina, caso já não esteja instalada. Siga a documentação: https://docs.flutter.dev/get-started/install

Após isso, copie o arquivo .env.example e cole na raiz do repositório.

Em seguida, renomei o arquivo para .env e adicione a baseURL do backend spring entre as aspas do BASE_URL="...".

Após essa configuração, volte ao projeto e execute os seguintes comandos no terminal:

- flutter clean
- flutter pub get
- dart run build_runner build
- cd uikit/
- flutter clean
- flutter pub get
- cd ..

Conecte o usb do seu disposito android no computador e esolha o dispositivo (Durante a execução do sistema):

- flutter devices

Rode o aplicativo (Durante a execução do sistema):

- flutter run -d nome_do_dispositivo --verbose

