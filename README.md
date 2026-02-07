![Thumbnail GitHub](./thumb.png)

# 📱 Client Control - Testes de Integração

![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)

> Aplicação Flutter de gerenciamento de clientes com implementação de testes de integração

Projeto desenvolvido durante o curso **"Flutter: implementando testes de integração"** da [Alura](https://www.alura.com.br/), como parte do **BootCamp Santander de Desenvolvimento Mobile 2025**.

## 📋 Sobre o Projeto

Client Control é uma aplicação de gerenciamento de clientes que permite cadastrar clientes, tipos de clientes e vincular os tipos aos clientes cadastrados. O foco principal deste projeto é a implementação de **testes de integração** para validar fluxos completos da aplicação.

![Screenshot do App](./screenshot.png)

## ✨ Funcionalidades

- 📝 Cadastro de clientes
- 🏷️ Gerenciamento de tipos de clientes (Platinum, Golden, Titanium, Diamond)
- 🔗 Vinculação de tipos aos clientes
- 🎨 Seleção de ícones personalizados para tipos de clientes
- 📱 Interface responsiva e intuitiva
- ✅ Testes de integração implementados

## 🧪 Testes de Integração

O projeto implementa testes de integração que validam:

- ✅ Navegação entre páginas
- ✅ Interação com widgets (botões, menus, diálogos)
- ✅ Fluxos completos de usuário
- ✅ Comportamentos esperados da aplicação
- ✅ Criação de novos tipos de clientes
- ✅ Seleção de ícones personalizados
- ✅ Validação de dados após operações CRUD
- ✅ Criação e exclusão de clientes (Dismissible)
- ✅ Verificação do funcionamento do botão Sair no Drawer

### Cenários de Teste Implementados

#### Teste de Integração (`integration_test/app_test.dart`)

O teste de integração completo valida o seguinte fluxo:

1. **Inicialização**: Verifica se a página de clientes é carregada corretamente
2. **Menu de Navegação**: Testa a abertura do menu hambúrguer e suas opções
3. **Navegação para Tipos**: Acessa a página de tipos de clientes
4. **Validação de Tipos Padrão**: Verifica a presença de tipos pré-cadastrados (Platinum, Golden, Titanium, Diamond)
5. **Criação de Novo Tipo**: 
   - Abre o diálogo de criação
   - Insere o nome "Ferro"
   - Seleciona um ícone personalizado (card_giftcard)
   - Salva o novo tipo
6. **Validação de Persistência do Tipo**: Confirma que o novo tipo foi criado e está visível na lista
7. **Criação de Novo Cliente**:
   - Navega para a página de gerenciar clientes
   - Adiciona um cliente "DandaraBot" com email e tipo "Ferro"
   - Valida a criação do cliente
8. **Exclusão de Cliente**:
   - Executa swipe gesture (Dismissible) para deletar o cliente
   - Confirma que o cliente foi removido da interface

#### Testes de Widget (`test/widget_test.dart`)

##### Testes do Menu Hambúrguer
- ✅ Verificação de todos os itens do menu (Menu, Gerenciar clientes, Tipos de clientes, Sair)
- ✅ Teste específico do botão "Sair" no Drawer que finaliza o aplicativo

##### Testes do Icon Picker
- ✅ Abertura do diálogo de seleção de ícones
- ✅ Exibição de múltiplos ícones no GridView
- ✅ Seleção de ícone específico e retorno do valor
- ✅ Funcionalidade do botão "Fechar"

### Executar Testes

**Testes de Integração:**
```bash
flutter test integration_test/app_test.dart
```

**Testes de Widget:**
```bash
flutter test test/widget_test.dart
```

**Todos os Testes:**
```bash
flutter test
```

## 🛠️ Tecnologias Utilizadas

- **Flutter** - Framework para desenvolvimento mobile
- **Dart** - Linguagem de programação
- **Provider** - Gerenciamento de estados
- **Integration Test** - Testes de integração
- **Material Design** - Design system

## 📦 Dependências Principais

```yaml
dependencies:
  flutter:
    sdk: flutter
  provider: ^6.0.3
  cupertino_icons: ^1.0.2

dev_dependencies:
  integration_test:
    sdk: flutter
  flutter_test:
    sdk: flutter
  flutter_lints: ^1.0.0
```

## 🚀 Como Executar o Projeto

### Pré-requisitos

- [Flutter SDK](https://docs.flutter.dev/get-started/install) (versão 2.16.2 ou superior)
- [Android Studio](https://developer.android.com/) ou [VS Code](https://code.visualstudio.com/)
- Emulador Android/iOS ou dispositivo físico

### Instalação

1. Clone o repositório:
```bash
git clone https://github.com/OYanEnrique/alura-flutter-test-2.git
cd alura-flutter-test-2
```

2. Instale as dependências:
```bash
flutter pub get
```

3. Execute o projeto:
```bash
flutter run
```

## 🎯 Aprendizados do Curso

Durante o desenvolvimento deste projeto, foram aplicados os seguintes conceitos:

### Testes de Integração
- 🔍 Configuração do ambiente de testes de integração
- 🎭 Uso do `IntegrationTestWidgetsFlutterBinding`
- 🧩 Testes de interação com widgets
- 📊 Validação de fluxos completos da aplicação
- 🔎 Uso de `Finders` para localizar widgets (byType, byIcon, byText)
- ⏱️ Sincronização com `pumpAndSettle()` para aguardar animações
- 📝 Testes de formulários e entrada de texto
- 🎯 Validação de criação e persistência de dados
- 🎨 Testes de seleção de ícones e interação com diálogos
- 🗑️ Testes de gestures (Dismissible) para exclusão de itens
- 🔧 Refatoração para named parameters para melhor testabilidade

### Testes de Widget
- 🔬 Criação de testes de widget isolados
- 🎯 Testes de componentes específicos (Icon Picker, Menu)
- ✅ Validação de comportamento de UI components
- 🧪 Testes de diálogos e interações assíncronas
- 📱 Mock de contextos e builders para testes

### Gerenciamento de Estados
- 🔄 `Provider` como gerenciador de estados
- 📢 `ChangeNotifier` para notificação de mudanças
- 🌳 `Consumer` para leitura reativa de estados
- 🎯 `Provider.of` para acesso aos estados
- 🎪 `MultiProvider` para múltiplos providers
- 💡 Conceito de *Single Source of Truth*

### Boas Práticas
- 📐 Organização de código e arquitetura
- 🧱 Separação de responsabilidades (Models, Pages, Components)
- 🎨 Componentização de widgets
- ✅ Testes automatizados
- 🔧 Uso de named parameters para maior flexibilidade e legibilidade
- 🎯 Injeção de dependências via Provider para facilitar testes

## 📁 Estrutura do Projeto

```
lib/
├── main.dart                    # Ponto de entrada da aplicação
├── components/                  # Componentes reutilizáveis
│   ├── hamburger_menu.dart
│   └── icon_picker.dart
├── models/                      # Modelos de dados
│   ├── client.dart
│   ├── clients.dart
│   ├── client_type.dart
│   └── types.dart
├── pages/                       # Páginas da aplicação
│   ├── clients_page.dart
│   └── client_types_page.dart
└── state/                       # Gerenciadores de estado
    └── types_state.dart

integration_test/                # Testes de integração
└── app_test.dart

test/                            # Testes unitários e de widget
├── unit_test.dart
└── widget_test.dart
```

## 👨‍💻 Autor

Desenvolvido por [OYanEnrique](https://github.com/OYanEnrique) durante o BootCamp Santander 2025.

## 📚 Recursos e Referências

- [Documentação Flutter](https://docs.flutter.dev/)
- [Provider Package](https://pub.dev/packages/provider)
- [Integration Testing Flutter](https://docs.flutter.dev/testing/integration-tests)
- [Curso Alura - Flutter: implementando testes de integração](https://www.alura.com.br/)

## 📝 Licença

Este projeto foi desenvolvido para fins educacionais como parte do BootCamp Santander 2025.

---

⭐ **Desenvolvido com Flutter durante o BootCamp Santander 2025** ⭐

Esse curso faz parte da [formação de Flutter da Alura](https://cursos.alura.com.br/formacao-flutter)

