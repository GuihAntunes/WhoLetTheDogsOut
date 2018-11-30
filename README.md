# WhoLetTheDogsOut
# Requisitos
- Xcode 10
- Swift 4
- Cocoapods

# Antes de rodar o projeto
Antes de rodar o projeto, por favor, rode 'pod install' dentro da pasta onde se encontra o Podfile através do terminal.

# Arquitetura
- **Model:** Representa os dados da aplicação
- **View:** Camada de apresentação visual
- **ViewModel:** Camada de regras de apresentação e regras de negócio (se houver alguma no front)
- **Repository:** Repositório de dados. Decide se busca o dado do cache ou do serviço
- **Service:** Camada que busca os dados da internet
- **DataManager:** Camda que busca os dados do cache

# Dependencias
- **Alamofire:** Biblioteca para realizar requisições a partir de URL
- **SDWebImage:** Biblioteca de image loader e cacher para baixar as imagens da Internet
- **Promises:** Biblioteca para tratar código assíncrono com mais facilidade
- **IQKeyboardManager:** Biblioteca para facilitar tratativa de textfields e teclado
- **Disk:** Biblioteca para facilitar cache de dados
- **Reachability:** Biblioteca para facilitar verificação de conexão de rede

