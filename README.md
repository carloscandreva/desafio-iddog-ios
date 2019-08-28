# Challenge for Mobile



[![Build Status](https://travis-ci.org/joemccann/dillinger.svg?branch=master)](https://travis-ci.org/joemccann/dillinger)

Challenge for Mobile foram utilizados as seguintes PODS

  - Alamofire
  - SwiftLint
  - Kingfisher
  - SwiftMessages
  - Reachability

# Alamofire

  - Utilizado para requisições na API
# SwiftLint

  - Foi colcoado na ideia de colocar um lint mínimo no projeto, porém não consegui tempo hábil para tornar o SwiftLint viável.

# Kingfisher

  - Utilizado para carregamento de imagens e cache, na galeria.

# SwiftMessages

  - Utilizado para handler de erro com toasts bonitos para sinalizar que algo deu errado.

# Reachability

  - Utilizado para validação de conexão com internet.


### Tech

Foi utilizad uma arquitetura MVVM, utilizando um Coordinator para cordenar a navegação entre as controller.
Faltou colocar Lottie e tratar melhor o layout. Não consegui também terminar o mock com JSON, junto da sessão e o Alomofire. Além de melhorias futuras no layout nesse projeto, prentedo refazer a parte de URL e sessão nos testes, para assim contemplar melhor JSONS de requests mockados e também contruir um test de UI testando os componentes de tela, quem sabe até utilizar o FBSnapshot para testes de aparência fixa. A api não possuia páginação, teria como fazer uma páginação local, mas preferi deixar loading infnito. Poderia também ter adicionado um arquivo de internacionalização, mas infelizmente não consegui muito tempoi essa semana, acredito que ao menos o conceito de arquitetura já consegui passar aqui.
